//
//  ImagesViewModel.swift
//  BatchImages
//
//  Created by Antonio Jesús on 11/10/23.
//

import Foundation
import Combine
import SwiftUI

final class BatchImagesViewModel: ObservableObject {
    
    private var subscribers = Set<AnyCancellable>()
    private var photoPublishers: [AnyPublisher<PhotoModel, URLError>] {
        ImagesData().urls.map { getPhotoPublisher(url: $0) }
    }
    
    @Published var photos: [PhotoModel] = []
    
    private func getPhotoPublisher(url: URL) -> AnyPublisher<PhotoModel, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap { UIImage(data: $0) }
            .map { PhotoModel(image: Image(uiImage: $0) ) }
            .eraseToAnyPublisher()
    }
    
    func downloadImages() {
        Publishers.MergeMany(photoPublishers)
            .collect()
            .receive(on: RunLoop.main) // This is necessary because after update photos property the view will refresh
            .sink { completion in
                if case .failure(let error) = completion {
                    print("An error occurred: \(error)")
                }
            } receiveValue: { photos in
                self.photos = photos
            }
        
            .store(in: &subscribers)
    }
}


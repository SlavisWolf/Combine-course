
import Combine
import Foundation
import UIKit

let imagesPub = ["fiordland", "golf", "laguna_tres", "manawatu_wanganui", "memorial", "riwaka", "wonder_wood"].publisher

imagesPub
    .tryCompactMap { path in
        if let url = Bundle.main.url(forResource: path, withExtension: "jpeg") {
            return try Data(contentsOf: url)
        }
        
        return nil
    }
    .compactMap { imageData in
        UIImage(data: imageData)
    }
    .sink { completion in
        
        switch completion {
            
        case .finished:
            print("No collect Images loaded")
        case .failure(let error):
            print(error.localizedDescription)
        }
    } receiveValue: { image in
        print("No collect \(image)")
    }


imagesPub
    .tryCompactMap { path in
        if let url = Bundle.main.url(forResource: path, withExtension: "jpeg") {
            return try Data(contentsOf: url)
        }
        
        return nil
    }
    .compactMap { imageData in
        UIImage(data: imageData)
    }
    .collect()
    .sink { completion in
        
        switch completion {
            
        case .finished:
            print("collect Images loaded")
        case .failure(let error):
            print(error.localizedDescription)
        }
    } receiveValue: { images in
        print(images.count)
        images.forEach({ image in
            print("Collect: \(image)")
        })
    }

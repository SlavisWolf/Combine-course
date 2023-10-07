

import Combine
import Foundation
import UIKit

let imagesPub = ["fiordland", "golf", "laguna_tres", "manawatu_wanganui", "memorial", "riwaka", "wonder_wood"].publisher

class ImageLogger: TextOutputStream {
    func write(_ string: String) {
        print("Data received: \(string)")
    }
}

imagesPub
    .tryCompactMap { path in
        if let url = Bundle.main.url(forResource: path, withExtension: "jpeg") {
            return try Data(contentsOf: url)
        }
        
        return nil
    }
Data().count
    .handleEvents(receiveOutput: { print("Bytes: \($0.count)" ) } )
    .breakpoint(receiveOutput: { $0.count == .zero} )
    .compactMap { imageData in
        UIImage(data: imageData)
    }
    .print("Control post compact map", to: ImageLogger() )
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

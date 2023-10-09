import UIKit
import Combine

let urlCiri = URL(string: "https://images.hdqwalls.com/wallpapers/ciri-witcher-cosplay-4k-yn.jpg")!

enum NetworkError: Error {
    case general
    case notFound(Int)
    case noValidImage
}

func downloadImage(from url: URL) -> Future<UIImage, NetworkError> {
    Future<UIImage, NetworkError> { promise in
        URLSession.shared.dataTask(with: URLRequest(url: urlCiri)) { data, response, error in
            
            guard let data, let response = response as? HTTPURLResponse, error == nil else {
                promise(.failure(.general))
                return
            }
            
            guard response.statusCode == 200 else {
                promise(.failure(.notFound(response.statusCode) ) )
                return
            }
            
            if let image = UIImage(data: data) {
                promise(.success(image) )
            } else {
                promise(.failure(.noValidImage))
            }
        }.resume()
    }
}

var subscribers = Set<AnyCancellable>()

downloadImage(from: urlCiri)
    .sink { completion in
        switch completion {
        case .finished:
            print("All finished correctly")
        case .failure(let error):
            if case .notFound(let code) = error {
                print("Not found with code: \(code)")
            } else {
                print("An error occurred: \(error)")
            }
        }
    } receiveValue: { image in
        debugPrint(image)
        image
    }.store(in: &subscribers)


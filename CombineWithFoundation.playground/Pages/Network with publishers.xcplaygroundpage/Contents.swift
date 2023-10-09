
import UIKit
import Combine


let urlGeralt = URL(string: "https://hdwallpaperim.com/wp-content/uploads/2017/08/25/464130-Geralt_of_Rivia-magic-The_Witcher-The_Witcher_3_Wild_Hunt.jpg")!
var subscribers = Set<AnyCancellable>()

URLSession.shared.dataTaskPublisher(for: urlGeralt)
    //.map(\.data)
    .tryMap({ (data, response) in
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badURL)
        }
        
        return data
    })
    .compactMap { UIImage(data: $0) }
    .replaceError(with: UIImage(imageLiteralResourceName: "question_marks") )
    .sink { completion in
        switch completion {
        case .finished:
            print("Finished")
        case .failure(let error):
            print("Error: \(error)")
        }
    } receiveValue: { image in
        debugPrint(image)
        image
    }
    .store(in: &subscribers)


// CLASS STYLE

final class Ciri {
    
    var image: UIImage?
    var ciriSubscribers = Set<AnyCancellable>()
    let url = URL(string: "https://images.hdqwalls.com/wallpapers/ciri-witcher-cosplay-4k-yn.jpg")!
    
    func getCiri() {
        URLSession.shared.dataTaskPublisher(for: url)
            //.map(\.data)
            .tryMap({ (data, response) in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badURL)
                }
                
                return data
            })
            .compactMap { UIImage(data: $0) }
            .replaceError(with: UIImage(imageLiteralResourceName: "question_marks") )
            .assign(to: \.image, on: self)
            .store(in: &ciriSubscribers)
    }
}


let ciri = Ciri()
ciri.getCiri()
sleep(4)
if let image = ciri.image {
    debugPrint(image)
}
ciri.image

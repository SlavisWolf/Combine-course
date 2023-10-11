
import Combine
import Foundation
import UIKit

let domain = "http://127.0.0.1:8080/CombineCourse"
let postsUrl = URL(string: "\(domain)/posts")!
let authorsUrl = URL(string: "\(domain)/author")!
let session = URLSession.shared
let decoder = JSONDecoder()

func getImagePublisher(url: URL) -> AnyPublisher<UIImage, Error> {
    session.dataTaskPublisher(for: url)
        .map(\.data)
        .compactMap({ UIImage(data: $0) } )
        .mapError( { $0 as Error } )
        .eraseToAnyPublisher()
}

func getAuthorPublisher(authorId: Int) -> AnyPublisher<AuthorModel, Error> {
    session.dataTaskPublisher(for: authorsUrl.appending(path: "/\(authorId)"))
        .map(\.data)
        .decode(type: AuthorModel.self, decoder: decoder)
        .eraseToAnyPublisher()
}

var subscribers = Set<AnyCancellable>()

let postPublisher = session.dataTaskPublisher(for: postsUrl)
    .map(\.data)
    .decode(type: [PostModel].self , decoder: decoder)
    .compactMap { $0.first }
    .share()
    .eraseToAnyPublisher()


let imagePublisher = postPublisher
    .flatMap { post in
        getImagePublisher(url: post.jetpackFeaturedMediaUrl)
    }

let authorPublisher = postPublisher
    .flatMap { post in
        getAuthorPublisher(authorId: post.author)
    }
    .share()

let avatarPublisher = authorPublisher.flatMap { author in
    getImagePublisher(url: author.avatarUrl)
}

Publishers.Zip4(postPublisher, imagePublisher, authorPublisher, avatarPublisher)
    .sink { completion in
        if case .failure(let error) = completion {
            print("Error: \(error)")
        }
    } receiveValue: { (post, image, author, avatar) in
        print(post)
        print(author)
        print(image)
        print(avatar)
        image
        avatar
    }
    .store(in: &subscribers)


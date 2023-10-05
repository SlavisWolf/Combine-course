

import Combine
import Foundation

func newPublisher(value: String) -> CurrentValueSubject<String, Never> {
    .init(value.lowercased())
}

let publisher = ["Hi", "I", "am", "Ralph"].publisher

let pub = publisher
    .map { $0.uppercased() }
    .map(\.localizedCapitalized) // Keypath version
    .flatMap (maxPublishers: .max(2) )  { newPublisher(value: $0) }


let subscriber = pub.sink(receiveValue: { print($0 ) } )

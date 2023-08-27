

import Combine

let publisher = [1, 4, 6, 5, 7, 8, 6, 5].publisher
let subscriber = publisher.sink { print("\($0) received") }


class AnObject {
    var value = "" {
        didSet { print("\(value) assigned") }
    }
}


let object = AnObject()

let publisher2 = ["Hello", "Bye", "See you", "What's up"].publisher
let subscriber2 = publisher2.assign(to: \.value, on: object)

dump(object)

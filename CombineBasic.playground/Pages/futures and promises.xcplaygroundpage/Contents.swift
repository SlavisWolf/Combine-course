

import Combine
import Foundation


func increase(value: Int) -> Int {
    value + 1
}


func increaseWithTime(value: Int) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print(value + 1)
    }
}

increaseWithTime(value: increase(value: 3) )


func increaseWithFuture(value: Int, in seconds: TimeInterval = 1.0) -> Future<Int, Never> {
    Future<Int, Never> { promise in
        DispatchQueue.global().asyncAfter(deadline: .now() + seconds) {
            promise(.success(value + 1) )
        }
    }
}


let future = increaseWithFuture(value: 8, in: 2.2)
let subscriber = future.sink { print($0) }

let future2 = increaseWithFuture(value: 1, in: 5)
let subscriber2 = future2.sink { completion in
    if case .finished = completion {
        print("I has finished")
    }
} receiveValue: { result in
    print(result)
}


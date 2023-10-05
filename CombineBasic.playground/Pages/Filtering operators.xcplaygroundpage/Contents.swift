

import Foundation
import Combine


let nums = [1, 5, 7, 9, 9, 3, 5, 7, 6, 4 ,4 , 5, 6, 2, 4]

let number = nums.publisher

number.filter({ $0.isMultiple(of: 3) } )
    .sink { print("Multiples of 3: \($0)") }


number.removeDuplicates()
    .sink {
        print("Remove duplicates: \($0)")
    }

number.ignoreOutput()
    .sink { completion in
        if case .finished = completion {
            print("It's over")
        }
    } receiveValue: { value in
        print("\(value) received")
    }

number.first(where: {$0 % 3 == 0} )
    .sink { print("First value: \($0)") }

number.last(where: {$0 % 3 == 0} )
    .sink { print("Last value: \($0)") }


let semaphore = PassthroughSubject<Void, Never>()
let numbers = PassthroughSubject<Int, Never>()

numbers.drop(untilOutputFrom: semaphore)
    .sink { print("Drop: \($0)") }
 
nums.forEach({ n in
    if n == 3 { semaphore.send() }
    numbers.send(n)
})

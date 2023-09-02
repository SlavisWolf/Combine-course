
import Foundation
import Combine

let subject = CurrentValueSubject<Int, Never>(0)

subject.value

subject.send(1)
subject.send(2)
subject.value

sleep(1)

let subscription = subject.sink { print("\($0) value received") }
//The subscription receive the signal of the last value emitted by the subject.

sleep(1)

subject.send(3)

subject.send(completion: .finished)

subject.send(4)

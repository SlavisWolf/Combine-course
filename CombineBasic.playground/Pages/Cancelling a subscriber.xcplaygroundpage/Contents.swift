
import Foundation
import Combine


let subject = PassthroughSubject<String, Never>()

let subscriber = subject.sink { print($0) }


subject.send("A")
sleep(1)

subject.send("LONG")
sleep(1)

subject.send("TIME")
sleep(1)

subject.send("AGO")
sleep(1)

subject.send("IN")
sleep(1)

subject.send("A")
sleep(1)
subscriber.cancel()
subject.send("GALAXY")
sleep(1)

subject.send("FAR")
sleep(1)
subject.send("FAR")
sleep(1)

subject.send("AWAY")
sleep(1)


subject.send(completion: .finished)

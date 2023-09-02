
import Foundation
import Combine

enum CustomErrors: Error, LocalizedError {
    case bellyUp(Int), crashed, blewUp
    
    var errorDescription: String? {
        switch self {
        case .bellyUp(let value):
            return "App has dead with value: \(value) , rest in peace"
        case .crashed:
            return "App was crashed"
        case .blewUp:
            return "App blew up, BOOM"
        }
    }
}

let subject = PassthroughSubject<Int, CustomErrors>()

subject.send(1)

let subscriber = subject.sink { completion in
    switch completion {
        
    case .finished:
        print("Everything ended up well")
    case .failure(let error):
        print("An error occurred: \(error.localizedDescription)")
    }
} receiveValue: {
    print("Value \($0) received")
}

subject.send(2)
sleep(1)
subject.send(3)
sleep(1)
//subject.send(completion: .finished)
subject.send(completion: .failure(.bellyUp(3) ) )
sleep(1)
subject.send(4)

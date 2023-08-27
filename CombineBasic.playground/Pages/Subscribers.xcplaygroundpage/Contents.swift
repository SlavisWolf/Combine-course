

import Combine
import Foundation

class PublisherClass {
    
    var future: Future<String, Never> {
        Future<String, Never> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                promise(.success("OK"))
            }
        }
    }
    
    var subscribers = Set<AnyCancellable>()
    
    func start() {
        future.sink { print("\($0)")}
            .store(in: &subscribers)
        
        
        [5,2,7,4,4,3,1]
            .publisher
            .map({"\($0)€"})
            .sink { print($0) }
            .store(in: &subscribers)
    }
}


let class1 = PublisherClass()
class1.start()


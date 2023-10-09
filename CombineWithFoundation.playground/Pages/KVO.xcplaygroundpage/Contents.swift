
import Combine
import Foundation

final class Test: NSObject {
    @objc dynamic var property: Int = 0
}

let test = Test()

test.publisher(for: \.property)
    .map {
        print("Value received: \($0)")
        return $0
    }
    .sink { print($0) }



test.property = 1
sleep(2)
test.property = 2
sleep(2)
test.property = 3
sleep(2)
test.property = 4
sleep(2)
test.property = 5
sleep(2)

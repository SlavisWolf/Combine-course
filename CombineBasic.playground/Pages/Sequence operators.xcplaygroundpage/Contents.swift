
import Combine

let publisher = [5,3,7,1,3,9,2].publisher


publisher
    .min()
    .sink { print("Min Value: \($0)") }

publisher
    .max()
    .sink { print("Max Value: \($0)") }


let pub2 = ["How", "is", "it", "going"].publisher


pub2
    .min{$0.count < $1.count}
    .sink { print("Fewest characters: \($0)") }

pub2
    .max{$0.count < $1.count}
    .sink { print("Most characters: \($0)") }


publisher
    .first()
    .sink { print("First Value: \($0)") }

publisher
    .last()
    .sink { print("Last Value: \($0)") }

publisher
    .output(at: 2)
    .sink { print("Position 2(third value) Value: \($0)") }


publisher
    .output(in: 2...4)
    .sink { print("Position Range 2-4 Value: \($0)") }

publisher
    .count()
    .sink { print("Count: \($0)") }


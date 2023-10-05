
import Combine

let pub1 = [1,2,3].publisher
let pub2 = [4,5,6].publisher

pub1.append(pub2)
    .sink { print("Append: \($0)")}


pub1.prepend(pub2)
    .sink { print("Prepend: \($0)")}


let sub1 = PassthroughSubject<Int, Never>()
let sub2 = PassthroughSubject<Int, Never>()

sub1.merge(with: sub2)
    .sink { completion in
        if case .finished = completion { print("Sub1&2 merge is finished")}
    } receiveValue: { value in
        print("Sub1&2 merge: \(value)")
    }

let sub3 = PassthroughSubject<String, Never>()
sub3.combineLatest(sub2)
    .sink { print("Combine lastest: \($0)")}

sub1.send(1)
sub1.send(2)
sub2.send(3)
sub1.send(4)
sub2.send(5)
sub1.send(6)
sub1.send(7)
sub1.send(completion: .finished)
sub2.send(8)
sub2.send(completion: .finished)
sub3.send("9")
sub3.send("10")
sub3.send("11")
sub3.send(completion: .finished)


let sub5 = PassthroughSubject<String, Never>()
let sub6 = PassthroughSubject<Int, Never>()


sub5.zip(sub6)
    .sink { print("Zip sub5&6: \($0)")}

sub5.send("a")
sub5.send("b")

sub6.send(3)
sub5.send("c")
sub6.send(5)

import Foundation

public final class Sender {
    
    var timer: Timer?
    
    public init() {
        timer = .scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            NotificationCenter.default.post(name: .myNotification, object: "Secret message: \(Int.random(in: 1...50) )")
        }
    }
}

import Foundation
import Combine

public final class Receiver {
    
    var message: String = "" {
        didSet {
            if !message.isEmpty {
                print("Message received: \(message)")
            }
        }
    }
    var subscribers: Set<AnyCancellable> = Set<AnyCancellable>()
    
    public init() {
        NotificationCenter.default
            .publisher(for: .myNotification)
            .compactMap({ $0.object as? String } )
            .assign(to: \.message, on: self)
            .store(in: &subscribers)
    }
}

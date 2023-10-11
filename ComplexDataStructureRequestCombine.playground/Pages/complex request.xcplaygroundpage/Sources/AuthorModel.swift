
import Foundation

public struct AuthorModel: Identifiable, Codable {
    public let id: Int
    public let name:String
    public let avatarUrl: URL
}

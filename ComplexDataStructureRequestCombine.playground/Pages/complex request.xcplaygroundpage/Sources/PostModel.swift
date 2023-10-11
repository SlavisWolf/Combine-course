
import Foundation

public struct PostModel: Identifiable, Codable {
    public let id: Int
    public struct RenderedModel: Codable {
        public let rendered: String
        public let protected: Bool?
    }

    public let title: RenderedModel
    public let excerpt: RenderedModel
    public let jetpackFeaturedMediaUrl: URL
    public let author: Int
}



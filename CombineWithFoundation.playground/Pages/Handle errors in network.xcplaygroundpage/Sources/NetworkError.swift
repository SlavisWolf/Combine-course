import Foundation

public enum NetworkError: Error {
    case general(String)
    case timeout(String)
    case notFound(String)
    case badConnection(String)
}

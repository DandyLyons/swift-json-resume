import Foundation

// MARK: - Profile
public struct Profile: Codable, Hashable, Sendable {
    /// e.g. Facebook or Twitter
    public var network: String?
    /// e.g. http://twitter.example.com/neutralthoughts
    public var url: String?
    /// e.g. neutralthoughts
    public var username: String?

    public init(network: String?, url: String?, username: String?) {
        self.network = network
        self.url = url
        self.username = username
    }
}

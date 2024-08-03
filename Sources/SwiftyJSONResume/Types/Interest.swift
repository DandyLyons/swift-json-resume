import Foundation

// MARK: - Interest
public struct Interest: Codable, Hashable, Sendable {
    public var keywords: [String]?
    /// e.g. Philosophy
    public var name: String?

    public init(keywords: [String]?, name: String?) {
        self.keywords = keywords
        self.name = name
    }
}

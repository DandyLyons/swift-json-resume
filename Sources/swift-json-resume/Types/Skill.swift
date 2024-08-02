import Foundation

// MARK: - Skill
public struct Skill: Codable, Hashable, Sendable {
    /// List some keywords pertaining to this skill
    public var keywords: [String]?
    /// e.g. Master
    public var level: String?
    /// e.g. Web Development
    public var name: String?

    public init(keywords: [String]?, level: String?, name: String?) {
        self.keywords = keywords
        self.level = level
        self.name = name
    }
}

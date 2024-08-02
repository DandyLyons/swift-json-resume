import Foundation

// MARK: - Language
public struct Language: Codable, Hashable, Sendable {
    /// e.g. Fluent, Beginner
    public var fluency: String?
    /// e.g. English, Spanish
    public var language: String?

    public init(fluency: String?, language: String?) {
        self.fluency = fluency
        self.language = language
    }
}

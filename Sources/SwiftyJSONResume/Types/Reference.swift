import Foundation

// MARK: - Reference
public struct Reference: Codable, Hashable, Sendable {
    /// e.g. Timothy Cook
    public var name: String?
    /// e.g. Joe blogs was a great employee, who turned up to work at least once a week. He
    /// exceeded my expectations when it came to doing nothing.
    public var reference: String?

    public init(name: String?, reference: String?) {
        self.name = name
        self.reference = reference
    }
}

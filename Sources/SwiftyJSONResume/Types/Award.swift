import Foundation

// MARK: - Award
public struct Award: Codable, Hashable, Sendable {
    /// e.g. Time Magazine
    public var awarder: String?
    public var date: String?
    /// e.g. Received for my work with Quantum Physics
    public var summary: String?
    /// e.g. One of the 100 greatest minds of the century
    public var title: String?

    public init(awarder: String?, date: String?, summary: String?, title: String?) {
        self.awarder = awarder
        self.date = date
        self.summary = summary
        self.title = title
    }
}

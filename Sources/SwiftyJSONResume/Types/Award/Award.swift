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

extension Award {
  public static let example: Self = .init(
    awarder: "Grace Hopper",
    date: "1970-01-01",
    summary: "Reward for excellence in Software Engineering.",
    title: "The Hopper Award"
  )
}


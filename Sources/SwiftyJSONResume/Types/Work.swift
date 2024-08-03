import Foundation




public struct Work: Codable, Hashable, Sendable {
    /// e.g. Social Media Company
    public var description: String?
    public var endDate: String?
    /// Specify multiple accomplishments
    public var highlights: [String]?
    /// e.g. Menlo Park, CA
    public var location: String?
    /// e.g. Facebook
    public var name: String?
    /// e.g. Software Engineer
    public var position: String?
    public var startDate: String?
    /// Give an overview of your responsibilities at the company
    public var summary: String?
    /// e.g. http://facebook.example.com
    public var url: String?

    public init(description: String?, endDate: String?, highlights: [String]?, location: String?, name: String?, position: String?, startDate: String?, summary: String?, url: String?) {
        self.description = description
        self.endDate = endDate
        self.highlights = highlights
        self.location = location
        self.name = name
        self.position = position
        self.startDate = startDate
        self.summary = summary
        self.url = url
    }
}

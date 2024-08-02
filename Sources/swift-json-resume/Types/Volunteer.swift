import Foundation

// MARK: - Volunteer
public struct Volunteer: Codable, Hashable, Sendable {
    public var endDate: String?
    /// Specify accomplishments and achievements
    public var highlights: [String]?
    /// e.g. Facebook
    public var organization: String?
    /// e.g. Software Engineer
    public var position: String?
    public var startDate: String?
    /// Give an overview of your responsibilities at the company
    public var summary: String?
    /// e.g. http://facebook.example.com
    public var url: String?

    public init(endDate: String?, highlights: [String]?, organization: String?, position: String?, startDate: String?, summary: String?, url: String?) {
        self.endDate = endDate
        self.highlights = highlights
        self.organization = organization
        self.position = position
        self.startDate = startDate
        self.summary = summary
        self.url = url
    }
}

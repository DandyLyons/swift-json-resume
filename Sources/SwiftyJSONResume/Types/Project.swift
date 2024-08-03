import Foundation

// MARK: - Project
public struct Project: Codable, Hashable, Sendable {
    /// Short summary of project. e.g. Collated works of 2017.
    public var description: String?
    public var endDate: String?
    /// Specify the relevant company/entity affiliations e.g. 'greenpeace', 'corporationXYZ'
    public var entity: String?
    /// Specify multiple features
    public var highlights: [String]?
    /// Specify special elements involved
    public var keywords: [String]?
    /// e.g. The World Wide Web
    public var name: String?
    /// Specify your role on this project or in company
    public var roles: [String]?
    public var startDate: String?
    /// e.g. 'volunteering', 'presentation', 'talk', 'application', 'conference'
    public var type: String?
    /// e.g. http://www.computer.org/csdl/mags/co/1996/10/rx069-abs.html
    public var url: String?

    public init(description: String?, endDate: String?, entity: String?, highlights: [String]?, keywords: [String]?, name: String?, roles: [String]?, startDate: String?, type: String?, url: String?) {
        self.description = description
        self.endDate = endDate
        self.entity = entity
        self.highlights = highlights
        self.keywords = keywords
        self.name = name
        self.roles = roles
        self.startDate = startDate
        self.type = type
        self.url = url
    }
}

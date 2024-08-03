import Foundation

// MARK: - Coordinate
public struct Coordinate: Codable, Hashable, Sendable {
    /// link to the version of the schema that can validate the resume
    public var schema: String?
    /// Specify any awards you have received throughout your professional career
    public var awards: [Award]?
    public var basics: Basics?
    /// Specify any certificates you have received throughout your professional career
    public var certificates: [Certificate]?
    public var education: [Education]?
    public var interests: [Interest]?
    /// List any other languages you speak
    public var languages: [Language]?
    /// The schema version and any other tooling configuration lives here
    public var meta: Meta?
    /// Specify career projects
    public var projects: [Project]?
    /// Specify your publications through your career
    public var publications: [Publication]?
    /// List references you have received
    public var references: [Reference]?
    /// List out your professional skill-set
    public var skills: [Skill]?
    public var volunteer: [Volunteer]?
    public var work: [Work]?

    public init(schema: String?, awards: [Award]?, basics: Basics?, certificates: [Certificate]?, education: [Education]?, interests: [Interest]?, languages: [Language]?, meta: Meta?, projects: [Project]?, publications: [Publication]?, references: [Reference]?, skills: [Skill]?, volunteer: [Volunteer]?, work: [Work]?) {
        self.schema = schema
        self.awards = awards
        self.basics = basics
        self.certificates = certificates
        self.education = education
        self.interests = interests
        self.languages = languages
        self.meta = meta
        self.projects = projects
        self.publications = publications
        self.references = references
        self.skills = skills
        self.volunteer = volunteer
        self.work = work
    }
}

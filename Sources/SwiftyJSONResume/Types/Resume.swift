import Foundation




public struct Resume: Codable, Hashable, Sendable {
    public var basics: Basics?
    public var work: [Work]?
    public var volunteer: [Volunteer]?
    public var education: [Education]?
    public var awards: [Award]?
    public var publications: [Publication]?
    public var skills: [Skill]?
    public var languages: [Language]?
    public var interests: [Interest]?
    public var references: [Reference]?
  
  public init(
    basics: Basics? = nil,
    work: [Work]? = nil,
    volunteer: [Volunteer]? = nil,
    education: [Education]? = nil,
    awards: [Award]? = nil,
    publications: [Publication]? = nil,
    skills: [Skill]? = nil,
    languages: [Language]? = nil,
    interests: [Interest]? = nil,
    references: [Reference]? = nil
  ) {
    self.basics = basics
    self.work = work
    self.volunteer = volunteer
    self.education = education
    self.awards = awards
    self.publications = publications
    self.skills = skills
    self.languages = languages
    self.interests = interests
    self.references = references
  }
}

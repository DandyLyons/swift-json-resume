import Foundation
import JSONSchema

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
  
  static func schema() throws -> [String: Any] {
    let schemaString = try Resources.read(file: .json(named: "schema"))
    guard let schemaJSON = schemaString.data(using: .utf8) else {
      throw Error.failedToReadSchemaFrom(string: schemaString)
    }
    guard let schemaDict = try JSONSerialization.jsonObject(with: schemaJSON, options: []) as? [String: Any] else {
      throw Error.failedToSerializeDictFor(data: schemaJSON)
    }
    return schemaDict
  }
  
  var isValidJSONResume: Bool {
    do {
      let dict = try Self.schema()
      let validationResult = try? JSONSchema.validate(self, schema: dict)
      return validationResult?.valid ?? false
    } catch {
      return false
    }
  }
  
  
}

extension Resume {
  public enum Error: Swift.Error {
    case failedToReadSchemaFrom(string: String)
    case failedToSerializeDictFor(data: Data)
  }
}

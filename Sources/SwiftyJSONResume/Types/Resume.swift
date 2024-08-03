import CustomDump
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
  
  /// whether this instance conforms to the jsonresume.org schema
  func isValidJSONResume() throws -> Bool {
    let schema = try Self.schema()
    let encoder = JSONEncoder()
    let data = try encoder.encode(self)
    let resumeDict = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    print("resumeDict:")
    customDump(resumeDict)
    let validationResult = try? JSONSchema.validate(resumeDict, schema: schema)
    print("validationResult?.isValid", validationResult?.isValid)
//    return validationResult?.isValid ?? false
    
    guard let validationResult else {
      print("No validation result")
      return false
    }
    if validationResult.isValid == false {
      print("Resume is not valid json resume.")
      customDump(validationResult)
      return false
    } else {
      return true
    }
  }
  
  
}

extension Resume {
  public enum Error: Swift.Error {
    case failedToReadSchemaFrom(string: String)
    case failedToSerializeDictFor(data: Data)
  }
}

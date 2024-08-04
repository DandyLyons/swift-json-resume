import CustomDump
import Foundation
import JSONSchema
import IssueReporting

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
  public var meta: Meta?
  
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
    references: [Reference]? = nil,
    meta: Meta? = nil
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
  
  static let schema: [String: Any] = {
    let schemaString = Resources.read(file: .json(named: "schema"))
    guard let schemaJSON = schemaString.data(using: .utf8) else {
      reportIssue("Schema loaded from disk is invalid utf8 string")
      return [:]
    }
    guard let schemaDict = try? JSONSerialization.jsonObject(with: schemaJSON, options: []) as? [String: Any] else {
      reportIssue("Schema loaded from disk is invalid [String: Any]")
      return [:]
    }
    return schemaDict
  }()
  
  /// whether this instance conforms to the jsonresume.org schema
  var isValidJSONResume: Bool {
    let encoder = JSONEncoder()
    guard let data = try? encoder.encode(self) else {
      reportIssue("Failed to encode resume to JSON. Resume:\(self)")
      customDump(self)
      return false
    }
    guard let resumeDict = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] else {
      reportIssue("Failed to serialize resume into [String: Any]")
      customDump(data)
      return false
    }
    let schema = Self.schema
    guard let validationResult = try? JSONSchema.validate(resumeDict, schema: schema) else {
      reportIssue("missing a validation result")
      return false
    }
    
    if validationResult.isValid == false {
      reportIssue("Resume is not valid json resume.")
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

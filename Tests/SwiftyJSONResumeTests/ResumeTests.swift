import XCTest
@testable import SwiftyJSONResume
import CustomDump
import JavaScriptCore
import JSONSchema

final class ResumeTests: XCTestCase {
  let exampleResume = Resume(
    basics: .init(
      email: "example@email.com",
      image: "image string",
      label: "label",
      location: .init(
        address: "123 Sesame Street",
        city: "New York",
        countryCode: "US",
        postalCode: "12345",
        region: "North America"
      ),
      name: "Blob McBlob",
      phone: "555-1234",
      profiles: [.init(
        network: "Twitter",
        url: "https://www.twitter.com",
        username: "example"
      )],
      summary: "This is a summary.",
      url: "https://www.google.com"
    ),
    work: [.init(
      description: "Work Description",
      endDate: "2020-01-01",
      highlights: ["This is a highlight"],
      location: "This is a location",
      name: "This is a job name",
      position: "This is a job position",
      startDate: "2010-12-12",
      summary: "This is a summary",
      url: "https://www.google.com"
    )],
    volunteer: [.init(
      endDate: nil,
      highlights: ["This is a volunteer highlight"],
      organization: "Organization name",
      position: "position",
      startDate: "2020-01-01",
      summary: "Summary of volunteer work",
      url: "https://www.google.com"
    )],
    education: [.init(
      area: "Area of education",
      courses: ["Example course"],
      endDate: nil,
      institution: "Education institution",
      score: "score",
      startDate: "2020-01-01",
      studyType: "study type",
      url: "https://www.google.com"
    )],
    awards: [.init(
      awarder: "Awarder",
      date: "2020-01-01",
      summary: "Sumary of award",
      title: "Title of award"
    )],
    publications: [.init(
      name: "Publication name",
      publisher: "Publisher name",
      releaseDate: "2020-01-01",
      summary: "Summary of publication",
      url: "https://www.google.com"
    )],
    skills: [.init(
      keywords: ["this is a keyword"],
      level: "This is a skill level",
      name: "This is a skill name"
    )],
    languages: [.init(
      fluency: "This is a fluency",
      language: "This is a language"
    )],
    interests: [.init(
      keywords: ["This is a keyword for an interest"],
      name: "This is a name for an interest"
    )],
    references: [.init(
      name: "This is a name of a reference",
      reference: "This is a reference"
    )],
    meta: .init(
      canonical: "https://www.google.com",
      lastModified: "2020-01-01T12:45:59",
      version: "1.0.0"
    )
  )
  
  func testResumeCodable() throws {
    let jsonString = Resources.read(file: .json(named: "sample.resume"))
    let data = jsonString.data(using: .utf8)!
    let decoder = JSONDecoder()
    let resume = try decoder.decode(Resume.self, from: data)
    let encoder = JSONEncoder()
    let reencoded = try encoder.encode(resume)
    let redecoded = try decoder.decode(Resume.self, from: reencoded)
    expectNoDifference(resume, redecoded)
  }
  
  func testValidation() throws {
    let schemaDict = Resume.schema
    
    let invalid: [String: Any] = [
      "basics": [
        "name": 23
      ]
    ]
    let resultInvalid = try JSONSchema.validate(invalid, schema: schemaDict)
    XCTAssertEqual(resultInvalid.valid, false)
    
    // an empty JSON dict should be valid
    let resultValid = try JSONSchema.validate([:], schema: schemaDict)
    XCTAssertEqual(resultValid.valid, true)
      
    let validJSONString: String = Resources.read(file: .json(named: "sample.resume"))
    let data = Data(validJSONString.utf8)
    let valid = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    
    let sampleResultValid = try JSONSchema.validate(valid, schema: schemaDict)
    XCTAssertEqual(sampleResultValid.isValid, true)
  }
  
  func testResumeSwiftTypeIsValid() throws {
    XCTAssertEqual(exampleResume.isValidJSONResume, true)
  }
  
  func testExportToJSONString() throws {
    let jsonString = exampleResume.asJSONString
    let data = Data(jsonString.utf8)
    let jsonAsDict = try JSONSerialization.jsonObject(with: data, options: [])
    let isJSONStringValid = try JSONSchema.validate(jsonAsDict, schema: Resume.schema).isValid
    XCTAssertEqual(isJSONStringValid, true)
    
    let decoder = JSONDecoder()
    XCTAssertNoThrow(try decoder.decode(Resume.self, from: data))
  }
}




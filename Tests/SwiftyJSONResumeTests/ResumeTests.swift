import XCTest
@testable import SwiftyJSONResume
import CustomDump
import JavaScriptCore
import JSONSchema

final class ResumeTests: XCTestCase {
  func testResumeCodable() throws {
    let jsonString = try Resources.read(file: .json(named: "sample.resume"))
    let data = jsonString.data(using: .utf8)!
    let decoder = JSONDecoder()
    let resume = try decoder.decode(Resume.self, from: data)
    let encoder = JSONEncoder()
    let reencoded = try encoder.encode(resume)
    let redecoded = try decoder.decode(Resume.self, from: reencoded)
    expectNoDifference(resume, redecoded)
  }
  
  func testValidation() throws {
    let schemaDict = try Resume.schema()
    
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
      
    let validJSONString: String = try Resources.read(file: .json(named: "sample.resume"))
    let data = Data(validJSONString.utf8)
    let valid = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    
    let sampleResultValid = try JSONSchema.validate(valid, schema: schemaDict)
    XCTAssertEqual(sampleResultValid.isValid, true)
  }
  
  func testResumeSwiftTypeIsValid() throws {
    let resume = Resume(
      basics: .init(
        email: "example@email.com",
        image: nil,
        label: nil,
        location: nil,
        name: "Blob McBlob",
        phone: "555-1234",
        profiles: nil,
        summary: "This is a summary.",
        url: "example.com"
      )
    )
    
    XCTAssertEqual(resume.isValidJSONResume, true)
  }
}




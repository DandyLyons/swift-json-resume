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
    let schemaString = try Resources.read(file: .json(named: "schema"))
    guard let schemaJSON = schemaString.data(using: .utf8) else {
      XCTFail("Failed to read schema from string: \(schemaString)")
      return
    }
    guard let schemaDict = try JSONSerialization.jsonObject(with: schemaJSON, options: []) as? [String: Any] else {
      XCTFail("Failed to serialize dict for json object: \(customDump(schemaJSON))")
      return
    }
    
    let inValid: [String: Any] = [
      "basics": [
        "name": 23
      ]
    ]
    let resultInvalid = try JSONSchema.validate(inValid, schema: schemaDict)
    XCTAssertEqual(resultInvalid.valid, false)
    
    // an empty JSON dict should be valid
    let resultValid = try JSONSchema.validate([:], schema: schemaDict)
    XCTAssertEqual(resultValid.valid, true)
      
    let validJSONString: String = try Resources.read(file: .json(named: "sample.resume"))
    let data = Data(validJSONString.utf8)
    let valid = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    
    let sampleResultValid = try JSONSchema.validate(valid, schema: schemaDict)
    XCTAssertEqual(sampleResultValid.isValid, true)
    customDump(sampleResultValid)
  }
}


extension ValidationResult {
  
  /// same as `valid` with a little extra logic
  ///
  /// Currently `JSONSchema.swift` is missing some use cases. For example, format validation of email is not yet supported.
  /// For this reason we simply return true for the unsupported cases.
  package var isValid: Bool {
    switch self.valid {
      case true: return true
      case false:
        guard let errors, !errors.isEmpty else {
          return true
        }
        for error in errors {
          if error.description == "\'format\' validation of \'email\' is not yet supported." {
            continue
          }
          return false
        }
        return true
    }
  }
}

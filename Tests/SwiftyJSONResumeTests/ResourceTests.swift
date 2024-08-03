import XCTest
@testable import SwiftyJSONResume

final class ResourceTests: XCTestCase {
  
  func testResourcesAreIncluded() throws {
    let expectedResources = [
      "schema.json",
      "job-schema.json",
      "validator.js",
      // Add all your expected resource file names here
    ]
    
    for resourceName in expectedResources {
      let components = resourceName.split(separator: ".")
      guard components.count == 2 else {
        XCTFail("Invalid resource name format: \(resourceName)")
        continue
      }
      
      let name = String(components[0])
      let _extension = String(components[1])
      
      let url = Bundle.module.url(forResource: name, withExtension: _extension)
      XCTAssertNotNil(url, "Resource not found: \(resourceName)")
      
      if let url = url {
        let fileExists = FileManager.default.fileExists(atPath: url.path)
        XCTAssertTrue(fileExists, "File does not exist at path: \(url.path)")
      }
    }
  }
  
  func testReadFiles() throws {
    let schemaFileString: String? = try Resources.read(file: .json(named: "schema"))
    XCTAssertNotNil(schemaFileString)
  }
}

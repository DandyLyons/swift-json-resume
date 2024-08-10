import XCTest
@testable import SwiftyJSONResume

final class ResourceTests: XCTestCase {
  
  func testResourcesAreIncluded() throws {
    let expectedResources = [
      "schema.json",
      "job-schema.json",
      "sample.resume.json",
      // Add all your expected resource file names here
    ]
    .map {
      var string = $0
      string.insert(contentsOf: "JavaScript/node_modules/@jsonresume/schema/", at: $0.startIndex)
      return string
    }
    
    let folderURL: URL? = Bundle.module.resourceURL?
      .appendingPathComponent("JavaScript/node_modules/@jsonresume/schema/", isDirectory: true)
    
    for resourceName in expectedResources {
      // Find the last occurrence of the dot to separate the extension
      guard let dotIndex = resourceName.lastIndex(of: ".") else {
        XCTFail("Invalid resource name format: \(resourceName)")
        continue
      }
      
      // Separate the name and extension
      let name = String(resourceName[..<dotIndex])
      let _extension = String(resourceName[resourceName.index(after: dotIndex)...])
      
      let url: URL? = folderURL?
        .appendingPathComponent("schema.json")
      
      XCTAssertNotNil(url, "Resource not found: \(resourceName)")
      
      if let url = url {
        let fileExists = FileManager.default.fileExists(atPath: url.path)
        XCTAssertTrue(fileExists, "File does not exist at path: \(url.path)")
      }
    }
  }
  
  func testReadFiles() {
    let schemaFileString: String? = Resources.read(
      fromFolder: .jsonresume_schema,
      file: .json(named: "schema")
    )
    XCTAssertNotNil(schemaFileString)
  }
}

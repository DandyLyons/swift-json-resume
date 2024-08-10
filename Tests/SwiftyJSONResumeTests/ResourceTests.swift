import XCTest
@testable import SwiftyJSONResume

final class ResourceTests: XCTestCase {
  func testReadFiles_1_2_1() {
    let expectedResources = [
      "schema",
      "job-schema",
      "sample.resume",
      "sample.job",
      // Add all your expected resource file names here
    ]
    
    for expectedResource in expectedResources {
      let schemaFileString: String? = Resources.read(
        fromFolder: .v1_2_1,
        file: .json(named: expectedResource)
      )
      XCTAssertNotNil(schemaFileString)
      XCTAssertEqual(schemaFileString?.isEmpty, false)
    }
  }
}

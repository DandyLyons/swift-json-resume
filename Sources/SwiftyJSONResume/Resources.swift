import Foundation
import IssueReporting

enum Resources {
  enum Error: Swift.Error {
    case failedToFindResourceAtPath(String)
    case failedToFindFile(File)
  }
  enum File {
    case json(named: String)
    case js(named: String)
  }
  
  static func read(file: File) -> String {
    let filePath: String?
    switch file {
      case .json(let name):
        filePath = Bundle.module.path(forResource: name, ofType: "json")
      case .js(named: let name):
        filePath = Bundle.module.path(forResource: name, ofType: "js")
    }
    
    guard let filePath = filePath,
      let contents = try? String(contentsOfFile: filePath, encoding: .utf8) else {
      reportIssue("no contents found at file path: \(String(describing: filePath))")
      return ""
    }
    return contents
  }
}

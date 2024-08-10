import Foundation
import IssueReporting

enum Resources {
  enum Error: Swift.Error {
    case failedToFindResourceAtPath(String)
    case failedToFindFile(File)
  }
  enum Folders {
    case jsonresume_schema
    
    var url: URL {
      let url: URL? = switch self {
        case .jsonresume_schema:
          Bundle.module.resourceURL?
            .appendingPathComponent("JavaScript/node_modules/@jsonresume/schema/")
      }
      return url ?? Bundle.main.bundleURL
    }
    
  }
  
  enum File {
    case json(named: String)
    case js(named: String)
  }
  
  static func read(fromFolder folder: Folders, file: File) -> String {
    var url = folder.url
    
    switch file {
      case .json(let name):
        url.appendPathComponent("\(name).json")
      case .js(named: let name):
        url.appendPathComponent("\(name).js")
    }
    
    guard let contents = try? String(contentsOf: url) else {
      reportIssue("no contents found at file path: \(url.absoluteString)")
      return ""
    }
    return contents
  }
}


import Foundation


enum Resources {
  enum Error: Swift.Error {
    case failedToFindResourceAtPath(String)
    case failedToFindFile(File)
  }
  enum File {
    case json(named: String)
    case js(named: String)
  }
  
  static func read(file: File) throws -> String {
    let filePath: String?
    switch file {
      case .json(let name):
        filePath = Bundle.module.path(forResource: name, ofType: "json")
      case .js(named: let name):
        filePath = Bundle.module.path(forResource: name, ofType: "js")
    }
    
    guard let filePath = filePath else {
      throw Error.failedToFindFile(file)
    }
    
    let contents = try String(contentsOfFile: filePath, encoding: .utf8)
    return contents
  }
  
//  static func readSchemaFile() throws -> String {
//    let filePath = Bundle.module.path(forResource: "schema", ofType: "json")
//    
//    guard let filePath = filePath else {
//      throw Error.failedToFindResourceAtPath("schema.json")
//    }
//    
//    let contents = try String(contentsOfFile: filePath, encoding: .utf8)
//    return contents
//  }
  
//  // Usage
//  if let schemaString = readSchemaFile() {
//    print("Schema loaded successfully")
//    // Use schemaString as needed
//  } else {
//    print("Failed to load schema")
//  }
}

//
//  File.swift
//  
//
//  Created by Daniel Lyons on 2024-08-03.
//

import Foundation
import JSONSchema

extension ValidationResult {
  
  /// same as `valid` with a little extra logic
  ///
  /// Currently `JSONSchema.swift` is missing some use cases. For example, format validation of email is not yet supported.
  /// For this reason we simply return true for the unsupported cases.
  public var isValid: Bool {
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

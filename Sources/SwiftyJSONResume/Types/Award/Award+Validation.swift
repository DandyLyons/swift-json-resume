

import Foundation
import JSONSchema

extension Award {
  @available(*, deprecated, message: "WIP EXPERIMENTAL")
  func _isValid<ValueType>(_ keyPath: KeyPath<Award, ValueType>) -> Bool {
    let schemaDict = Resume.schema
    let resume = Resume(awards: [self])
    let isValid = try? JSONSchema.validate(resume, schema: schemaDict).isValid
    return isValid ?? false
  }
}

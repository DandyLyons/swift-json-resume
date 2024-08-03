import Foundation

/// The schema version and any other tooling configuration lives here
// MARK: - Meta
public struct Meta: Codable, Hashable, Sendable {
    /// URL (as per RFC 3986) to latest version of this document
    public var canonical: String?
    /// Using ISO 8601 with YYYY-MM-DDThh:mm:ss
    public var lastModified: String?
    /// A version field which follows semver - e.g. v1.0.0
    public var version: String?

    public init(canonical: String?, lastModified: String?, version: String?) {
        self.canonical = canonical
        self.lastModified = lastModified
        self.version = version
    }
}

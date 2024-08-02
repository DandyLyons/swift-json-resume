import Foundation

// MARK: - Certificate
public struct Certificate: Codable, Hashable, Sendable {
    /// e.g. 1989-06-12
    public var date: String?
    /// e.g. CNCF
    public var issuer: String?
    /// e.g. Certified Kubernetes Administrator
    public var name: String?
    /// e.g. http://example.com
    public var url: String?

    public init(date: String?, issuer: String?, name: String?, url: String?) {
        self.date = date
        self.issuer = issuer
        self.name = name
        self.url = url
    }
}

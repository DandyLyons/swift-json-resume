import Foundation

// MARK: - Basics
public struct Basics: Codable, Hashable, Sendable {
    /// e.g. thomas@gmail.com
    public var email: String?
    /// URL (as per RFC 3986) to a image in JPEG or PNG format
    public var image: String?
    /// e.g. Web Developer
    public var label: String?
    public var location: Location?
    public var name: String?
    /// Phone numbers are stored as strings so use any format you like, e.g. 712-117-2923
    public var phone: String?
    /// Specify any number of social networks that you participate in
    public var profiles: [Profile]?
    /// Write a short 2-3 sentence biography about yourself
    public var summary: String?
    /// URL (as per RFC 3986) to your website, e.g. personal homepage
    public var url: String?

    public init(email: String?, image: String?, label: String?, location: Location?, name: String?, phone: String?, profiles: [Profile]?, summary: String?, url: String?) {
        self.email = email
        self.image = image
        self.label = label
        self.location = location
        self.name = name
        self.phone = phone
        self.profiles = profiles
        self.summary = summary
        self.url = url
    }
}

import Foundation

// MARK: - Location
public struct Location: Codable, Hashable, Sendable {
    /// To add multiple address lines, use
    /// . For example, 1234 Glücklichkeit Straße
    /// Hinterhaus 5. Etage li.
    public var address: String?
    public var city: String?
    /// code as per ISO-3166-1 ALPHA-2, e.g. US, AU, IN
    public var countryCode: String?
    public var postalCode: String?
    /// The general region where you live. Can be a US state, or a province, for instance.
    public var region: String?

    public init(address: String?, city: String?, countryCode: String?, postalCode: String?, region: String?) {
        self.address = address
        self.city = city
        self.countryCode = countryCode
        self.postalCode = postalCode
        self.region = region
    }
}

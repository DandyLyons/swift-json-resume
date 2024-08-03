import Foundation

// MARK: - Publication
public struct Publication: Codable, Hashable, Sendable {
    /// e.g. The World Wide Web
    public var name: String?
    /// e.g. IEEE, Computer Magazine
    public var publisher: String?
    public var releaseDate: String?
    /// Short summary of publication. e.g. Discussion of the World Wide Web, HTTP, HTML.
    public var summary: String?
    /// e.g. http://www.computer.org.example.com/csdl/mags/co/1996/10/rx069-abs.html
    public var url: String?

    public init(name: String?, publisher: String?, releaseDate: String?, summary: String?, url: String?) {
        self.name = name
        self.publisher = publisher
        self.releaseDate = releaseDate
        self.summary = summary
        self.url = url
    }
}

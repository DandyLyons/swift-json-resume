import Foundation

// MARK: - Education
public struct Education: Codable, Hashable, Sendable {
    /// e.g. Arts
    public var area: String?
    /// List notable courses/subjects
    public var courses: [String]?
    public var endDate: String?
    /// e.g. Massachusetts Institute of Technology
    public var institution: String?
    /// grade point average, e.g. 3.67/4.0
    public var score: String?
    public var startDate: String?
    /// e.g. Bachelor
    public var studyType: String?
    /// e.g. http://facebook.example.com
    public var url: String?

    public init(area: String?, courses: [String]?, endDate: String?, institution: String?, score: String?, startDate: String?, studyType: String?, url: String?) {
        self.area = area
        self.courses = courses
        self.endDate = endDate
        self.institution = institution
        self.score = score
        self.startDate = startDate
        self.studyType = studyType
        self.url = url
    }
}

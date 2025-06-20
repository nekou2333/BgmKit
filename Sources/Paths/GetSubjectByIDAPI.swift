import Foundation
import Get

extension Paths {
    static public func getSubjectByIDAPI(subjectID: Int) -> Request<Subject> {
        Request(path: "/v0/subjects/\(subjectID)", method: "GET", id: "getSubjectByIDAPI")
    }
}

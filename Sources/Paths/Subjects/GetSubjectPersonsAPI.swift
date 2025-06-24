import Get
import Foundation

extension Paths {
    static public func getSubjectPersonsAPI(subjectID: Int) -> Request<[RelatedPerson]> {
        Request(path: "/v0/subjects/\(subjectID)/persons", method: "GET", id: "getSubjectPersonsAPI")
    }
}

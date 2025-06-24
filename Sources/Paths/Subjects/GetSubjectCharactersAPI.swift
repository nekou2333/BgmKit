import Foundation
import Get

extension Paths {
    static public func getSubjectCharactersAPI(subjectID: Int) -> Request<[RelatedCharacter]> {
        Request(path: "/v0/subjects/\(subjectID)/characters", method: "GET", id: "getSubjectCharactersAPI")
    }
}
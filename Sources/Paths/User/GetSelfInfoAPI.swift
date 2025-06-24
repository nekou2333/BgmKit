import Foundation
import Get

extension Paths {
    static public func getSelfInfoAPI() -> Request<User> {
        Request(path: "/v0/me", method: "GET", id: "getSelfInfoAPI")
    }
}
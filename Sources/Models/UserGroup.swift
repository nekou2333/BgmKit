import Foundation

public enum UserGroup: Int, Codable {
    case admin = 1
    case bangumiAdmin = 2
    case doujinAdmin = 3
    case mutedUser = 4
    case bannedUser = 5
    case personAdmin = 8
    case wikiAdmin = 9
    case user = 10
    case wikiUser = 11

    public var description: String {
        switch self {
        case .admin:
            return "管理员"
        case .bangumiAdmin:
            return "Bangumi 管理猿"
        case .doujinAdmin:
            return "天窗管理猿"
        case .mutedUser:
            return "禁言用户"
        case .bannedUser:
            return "禁止访问用户"
        case .personAdmin:
            return "人物管理猿"
        case .wikiAdmin:
            return "维基条目管理猿"
        case .user:
            return "用户"
        case .wikiUser:
            return "维基人"
        }
    }

}

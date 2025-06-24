import Foundation

public struct User: Codable, Identifiable {
    public let id: Int
    public let username: String
    public let nickname: String
    public let userGroup: UserGroup
    public let avatar: Avatar
    public let sign: String
    public let email: String
    public let regTime: String
    public let timeOffset: Int

    public init(id: Int, username: String, nickname: String, userGroup: UserGroup, avatar: Avatar, sign: String, email: String, regTime: String, timeOffset: Int) {
        self.id = id
        self.username = username
        self.nickname = nickname
        self.userGroup = userGroup
        self.avatar = avatar
        self.sign = sign
        self.email = email
        self.regTime = regTime
        self.timeOffset = timeOffset
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try container.decode(Int.self, forKey: "id")
        self.username = try container.decode(String.self, forKey: "username")
        self.nickname = try container.decode(String.self, forKey: "nickname")
        self.userGroup = try container.decode(UserGroup.self, forKey: "user_group")
        self.avatar = try container.decode(Avatar.self, forKey: "avatar")
        self.sign = try container.decode(String.self, forKey: "sign")
        self.email = try container.decode(String.self, forKey: "email")
        self.regTime = try container.decode(String.self, forKey: "reg_time")
        self.timeOffset = try container.decode(Int.self, forKey: "time_offset")
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encode(username, forKey: "username")
        try container.encode(nickname, forKey: "nickname")
        try container.encode(userGroup, forKey: "user_group")
        try container.encode(avatar, forKey: "avatar")
        try container.encode(sign, forKey: "sign")
        try container.encode(email, forKey: "email")
        try container.encode(regTime, forKey: "reg_time")
        try container.encode(timeOffset, forKey: "time_offset")
    }
}
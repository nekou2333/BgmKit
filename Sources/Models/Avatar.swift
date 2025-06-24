import Foundation

public struct Avatar: Codable {
    public let large: String
    public let medium: String
    public let small: String

    public init(large: String, medium: String, small: String) {
        self.large = large
        self.medium = medium
        self.small = small
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)
        large = try container.decode(String.self, forKey: "large")
        medium = try container.decode(String.self, forKey: "medium")
        small = try container.decode(String.self, forKey: "small")
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)
        try container.encode(large, forKey: "large")
        try container.encode(medium, forKey: "medium")
        try container.encode(small, forKey: "small")
    }
}
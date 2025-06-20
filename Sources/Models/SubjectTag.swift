import Foundation

/// Tag
public struct SubjectTag: Codable, Hashable {
    public var count: Int
    public var name: String

    public init(count: Int, name: String) {
        self.count = count
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.count = try values.decode(Int.self, forKey: "count")
        self.name = try values.decode(String.self, forKey: "name")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(count, forKey: "count")
        try values.encode(name, forKey: "name")
    }
}

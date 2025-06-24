import Foundation

public struct Person: Codable, Hashable, Identifiable {
    public var id: Int
    public var name: String
    public var type: PersonType
    public var career: [PersonCareer]
    public var images: Images?
    public var shortSummary: String
    public var locked: Bool


    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)
        id = try container.decode(Int.self, forKey: "id")
        name = try container.decode(String.self, forKey: "name")                    
        type = try container.decode(PersonType.self, forKey: "type")
        career = try container.decode([PersonCareer].self, forKey: "career")
        images = try container.decodeIfPresent(Images.self, forKey: "images")
        shortSummary = try container.decode(String.self, forKey: "short_summary")
        locked = try container.decode(Bool.self, forKey: "locked")
    }

    public init(id: Int, name: String, type: PersonType, career: [PersonCareer], images: Images? = nil, shortSummary: String, locked: Bool) {
        self.id = id
        self.name = name
        self.type = type
        self.career = career
        self.images = images
        self.shortSummary = shortSummary
        self.locked = locked
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encode(name, forKey: "name")
        try container.encode(type, forKey: "type")
        try container.encode(career, forKey: "career")
        try container.encodeIfPresent(images, forKey: "images")
        try container.encode(shortSummary, forKey: "short_summary")
        try container.encode(locked, forKey: "locked")
    }
}



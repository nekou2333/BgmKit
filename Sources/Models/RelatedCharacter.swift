import Foundation

public struct RelatedCharacter: Codable, Hashable, Identifiable {
    public var id: Int
    public var name: String
    public var type: CharacterType
    public var images: Images?
    public var relation: String
    public var actors: [Person]?

    public init(id: Int, name: String, type: CharacterType, images: Images? = nil, relation: String, actors: [Person]? = nil) {
        self.id = id
        self.name = name
        self.type = type    
        self.images = images
        self.relation = relation
        self.actors = actors
    }

    public init(from decoder:  Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)
        id = try container.decode(Int.self, forKey: "id")
        name = try container.decode(String.self, forKey: "name")
        type = try container.decode(CharacterType.self, forKey: "type")
        images = try container.decodeIfPresent(Images.self, forKey: "images")
        relation = try container.decode(String.self, forKey: "relation")
        actors = try container.decodeIfPresent([Person].self, forKey: "actors")
    }

    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(type.rawValue, forKey: "type")
        try values.encodeIfPresent(images, forKey: "images")
        try values.encode(relation, forKey: "relation")
        try values.encodeIfPresent(actors, forKey: "actors")
    }
}

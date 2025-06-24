import Foundation

public struct RelatedPerson: Codable, Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let type: PersonType
    public let career: [PersonCareer]
    public let images: Images?
    public let relation: String
    public let eps: String

    public init(id: Int, name: String, type: PersonType, career: [PersonCareer], images: Images?=nil, relation: String, eps: String) {
        self.id = id
        self.name = name
        self.type = type
        self.career = career
        self.images = images
        self.relation = relation
        self.eps = eps
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try container.decode(Int.self, forKey: "id")
        self.name = try container.decode(String.self, forKey: "name")
        self.type = try container.decode(PersonType.self, forKey: "type")
        self.career = try container.decode([PersonCareer].self, forKey: "career")
        self.images = try container.decodeIfPresent(Images.self, forKey: "images")
        self.relation = try container.decode(String.self, forKey: "relation")
        self.eps = try container.decode(String.self, forKey: "eps")
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encode(name, forKey: "name")
        try container.encode(type, forKey: "type")
        try container.encode(career, forKey: "career")
        try container.encodeIfPresent(images, forKey: "images")
        try container.encode(relation, forKey: "relation")
        try container.encode(eps, forKey: "eps")
    }
}
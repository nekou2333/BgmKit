import Foundation

public struct Subject: Codable {
    public var id: Int
    public var type: SubjectType

    public var name: String
    public var nameCn: String
    public var summary: String

    // 是否为书籍系列的主条目
    public var series: Bool
    // Nsfw
    public var nsfw: Bool
    public var locked: Bool
    public var date: String?
    public var platform: String
    public var images: Images

    public var volumes: Int
    public var eps: Int
    public var totalEpisodes: Int

    public var rating: Rating
    public var collection: Collection?
    public var metaTags: [String]
    public var tags: [SubjectTag]

    public init(id: Int, type: SubjectType, name: String, nameCn: String, summary: String, series: Bool, nsfw: Bool, locked: Bool, date: String?, platform: String, images: Images, volumes: Int, eps: Int, totalEpisodes: Int, rating: Rating, collection: Collection, metaTags: [String], tags: [SubjectTag]) {
        self.id = id
        self.type = type
        self.name = name
        self.nameCn = nameCn
        self.summary = summary
        self.series = series
        self.nsfw = nsfw
        self.locked = locked
        self.date = date
        self.platform = platform
        self.images = images
        self.volumes = volumes
        self.eps = eps
        self.totalEpisodes = totalEpisodes
        self.rating = rating
        self.collection = collection
        self.metaTags = metaTags
        self.tags = tags
    }

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case name
        case nameCn = "name_cn"
        case summary
        case series
        case nsfw
        case locked
        case date
        case platform
        case images
        case volumes
        case eps
        case totalEpisodes = "total_episodes"
        case rating
        case collection
        case metaTags = "meta_tags"
        case tags
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        type = try values.decode(SubjectType.self, forKey: .type)
        name = try values.decode(String.self, forKey: .name)
        nameCn = try values.decode(String.self, forKey: .nameCn)
        summary = try values.decode(String.self, forKey: .summary)
        series = try values.decodeIfPresent(Bool.self, forKey: .series) ?? false
        nsfw = try values.decodeIfPresent(Bool.self, forKey: .nsfw) ?? false
        locked = try values.decodeIfPresent(Bool.self, forKey: .locked) ?? false
        date = try values.decodeIfPresent(String.self, forKey: .date) ?? ""
        platform = try values.decodeIfPresent(String.self, forKey: .platform) ?? ""
        images = try values.decode(Images.self, forKey: .images)
        volumes = try values.decodeIfPresent(Int.self, forKey: .volumes) ?? 0
        eps = try values.decodeIfPresent(Int.self, forKey: .eps) ?? 0
        totalEpisodes = try values.decodeIfPresent(Int.self, forKey: .totalEpisodes) ?? 0
        rating = try values.decode(Rating.self, forKey: .rating)
        collection = try values.decodeIfPresent(Collection.self, forKey: .collection)
        metaTags = try values.decodeIfPresent([String].self, forKey: .metaTags) ?? []
        tags = try values.decodeIfPresent([SubjectTag].self, forKey: .tags) ?? []
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encode(type, forKey: "type")
        try container.encode(name, forKey: "name")
        try container.encode(nameCn, forKey: "name_cn")
        try container.encode(summary, forKey: "summary")
        try container.encode(series, forKey: "series")
        try container.encode(nsfw, forKey: "nsfw")
        try container.encode(locked, forKey: "locked")
        try container.encode(date, forKey: "date")
        try container.encode(platform, forKey: "platform")
        try container.encode(images, forKey: "images")
        try container.encode(volumes, forKey: "volumes")
        try container.encode(eps, forKey: "eps")
        try container.encode(totalEpisodes, forKey: "total_episodes")
        try container.encode(rating, forKey: "rating")
        try container.encode(collection, forKey: "collection")
        try container.encode(metaTags, forKey: "meta_tags")
        try container.encode(tags, forKey: "tags")
    }
}

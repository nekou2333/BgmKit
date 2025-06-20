import Foundation

/// 评分
public struct Rating: Codable, Hashable {
    /// 各分值评分人数
    public var count: [String: Int]?
    /// 评分
    ///
    /// Example: 7.6
    public var score: Double?
    /// 总评分人数
    ///
    /// Example: 2289
    public var total: Int?

    public init(count: [String: Int]? = nil, score: Double? = nil, total: Int? = nil) {
        self.count = count
        self.score = score
        self.total = total
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.count = try values.decodeIfPresent([String: Int].self, forKey: "count")
        self.score = try values.decodeIfPresent(Double.self, forKey: "score")
        self.total = try values.decodeIfPresent(Int.self, forKey: "total")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(count, forKey: "count")
        try values.encodeIfPresent(score, forKey: "score")
        try values.encodeIfPresent(total, forKey: "total")
    }
}

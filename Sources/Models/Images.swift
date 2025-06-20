import Foundation

public struct Images: Codable, Hashable {
  /// Example: "https://lain.bgm.tv/pic/cover/c/c2/0a/12_24O6L.jpg"
  public var common: String?
  /// Example: "https://lain.bgm.tv/pic/cover/g/c2/0a/12_24O6L.jpg"
  public var grid: String?
  /// Example: "https://lain.bgm.tv/pic/cover/l/c2/0a/12_24O6L.jpg"
  public var large: String?
  /// Example: "https://lain.bgm.tv/pic/cover/m/c2/0a/12_24O6L.jpg"
  public var medium: String?
  /// Example: "https://lain.bgm.tv/pic/cover/s/c2/0a/12_24O6L.jpg"
  public var small: String?

  public init(
    common: String? = nil, grid: String? = nil, large: String? = nil, medium: String? = nil,
    small: String? = nil
  ) {
    self.common = common
    self.grid = grid
    self.large = large
    self.medium = medium
    self.small = small
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: StringCodingKey.self)
    self.common = try values.decodeIfPresent(String.self, forKey: "common")
    self.grid = try values.decodeIfPresent(String.self, forKey: "grid")
    self.large = try values.decodeIfPresent(String.self, forKey: "large")
    self.medium = try values.decodeIfPresent(String.self, forKey: "medium")
    self.small = try values.decodeIfPresent(String.self, forKey: "small")
  }

  public func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: StringCodingKey.self)
    try values.encodeIfPresent(common, forKey: "common")
    try values.encodeIfPresent(grid, forKey: "grid")
    try values.encodeIfPresent(large, forKey: "large")
    try values.encodeIfPresent(medium, forKey: "medium")
    try values.encodeIfPresent(small, forKey: "small")
  }
}

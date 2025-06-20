import Foundation

public struct Collection: Codable, Hashable {
  public var onHold: Int
  public var dropped: Int
  public var wish: Int
  public var collect: Int
  public var doing: Int

  enum CodingKeys: String, CodingKey {
    case collect
    case doing
    case dropped
    case onHold = "on_hold"
    case wish
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.collect = try values.decode(Int.self, forKey: .collect)
    self.doing = try values.decodeIfPresent(Int.self, forKey: .doing) ?? 0
    self.dropped = try values.decode(Int.self, forKey: .dropped)
    self.onHold = try values.decodeIfPresent(Int.self, forKey: .onHold) ?? 0
    self.wish = try values.decode(Int.self, forKey: .wish)
  }

  public func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: CodingKeys.self)
    try values.encode(collect, forKey: .collect)
    try values.encode(doing, forKey: .doing)
    try values.encode(dropped, forKey: .dropped)
    try values.encode(onHold, forKey: .onHold)
    try values.encode(wish, forKey: .wish)
  }
}

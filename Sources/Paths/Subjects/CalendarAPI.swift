import Foundation
import Get

extension Paths {
    static public var calendarAPI: Request<[CalenderAPIResponseItem]> {
        Request(path: "/calendar", method: "GET", id: "calendar")
    }

    public struct CalenderAPIResponseItem: Codable, Hashable, Identifiable {

        public var weekday: Weekday?
        public var items: [BgmKit.LegacySubjectSmall]

        public var id: Int {
            self.weekday?.id ?? 0
        }

        public struct Weekday: Codable, Hashable, Identifiable {
            public var id: Int

            public var cn: String?
            public var en: String?
            public var ja: String?

            public init(cn: String? = nil, en: String? = nil, id: Int, ja: String? = nil) {
                self.cn = cn
                self.en = en
                self.id = id
                self.ja = ja
            }

            public init(from decoder: any Decoder) throws {
                let container =
                    try decoder.container(
                        keyedBy: StringCodingKey.self)
                self.id = try container.decode(
                    Int.self, forKey: "id")
                self.cn = try container.decodeIfPresent(
                    String.self, forKey: "cn")
                self.en = try container.decodeIfPresent(
                    String.self, forKey: "en")
                self.ja = try container.decodeIfPresent(
                    String.self, forKey: "ja")
            }
        }

        public init(
            items: [BgmKit.LegacySubjectSmall] = [],
            weekday: Paths.CalenderAPIResponseItem.Weekday? = nil
        ) {
            self.items = items
            self.weekday = weekday
        }

        public init(from decoder: any Decoder) throws {
            let container =
                try decoder.container(keyedBy: StringCodingKey.self)
            self.weekday = try container.decodeIfPresent(
                Paths.CalenderAPIResponseItem.Weekday.self,
                forKey: "weekday")
            self.items = try container.decode(
                [LegacySubjectSmall].self, forKey: "items")
        }
    }
}

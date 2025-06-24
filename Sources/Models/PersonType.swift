import Foundation

public enum PersonType: Int, Codable, CaseIterable {
    case person = 1  //个人
    case company = 2 //公司
    case group = 3 //组合
}

import Foundation

// MARK: - PostNoticeDetailModelElement
struct PostNoticeDetailModelElement: Codable {
    let noticeImage, productName, producer: String
    let price: Int
    let link, explanation: String
    let size: Size
}

struct Size: Codable {
    let s, m, l, xl: Int
    let xxl: Int

    enum CodingKeys: String, CodingKey {
        case s = "S"
        case m = "M"
        case l = "L"
        case xl = "XL"
        case xxl = "XXL"
    }
}

typealias PostNoticeDetailModel = [PostNoticeDetailModelElement]

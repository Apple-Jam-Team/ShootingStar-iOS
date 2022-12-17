import Foundation

struct PostNoticeModelElement: Codable {
    let noticeImage, productName, producer: String
    let price: Int
}

typealias PostNoticeModel = [PostNoticeModelElement]

import Foundation

struct Product: Decodable {
    var identification: Int
    var vendorIdentification: Int
    var name: String
    var thumbnail: String
    var currency: Currency
    var price: Int
    var bargainPrice: Int
    var discountedPrice: Int
    var stock: Int
    var createdAt: Date
    var issuedAt: Date
    var images: [Image]
    var vendors: Vendors

    enum Codingkeys: String, CodingKey {
        case identification = "id"
        case vendorIdentification = "vendor_id"
        case name
        case thumbnail
        case currency
        case price
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case stock
        case createdAt = "created_at"
        case issuedAt = "issued_at"
        case image
        case vendors
    }
}

enum Currency: String, Decodable {
    case KRW
    case USD
}

struct Image: Decodable {
    var identification: Int
    var url: String
    var thumbnailUrl: String
    var succeed: Bool
    var issuedAt: String

    enum CodingKeys: String, CodingKey {
        case identification = "id"
        case url
        case thumbnailUrl = "thumbnail_url"
        case succeed
        case issuedAt = "issued_at"
    }
}

struct Vendors: Decodable {

}
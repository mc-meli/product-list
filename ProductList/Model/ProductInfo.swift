//
//  ProductInfo.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import Foundation

struct ProductInfo {
    let id: String
    let title: String
    let price: Int
    let currency: String
    let condition: String
    let permalink: URL
    let thumbnail: URL
    
    private var currencySimbol: String {
        switch currency {
        case "UYU": return "$"
        case "USD": return "U$S"
        default: return currency
        }
    }
    
    var displayPrice: String {
        "\(currencySimbol)\(price)"
    }
    
    var displayCondition: String {
        switch condition {
        case "new": return "Nuevo"
        case "used": return "Usado"
        default: return condition
        }
    }
    
    init(id: String, title: String, price: Int, currency: String, condition: String, permalink: URL, thumbnail: URL) {
        self.id = id
        self.title = title
        self.price = price
        self.currency = currency
        self.condition = condition
        self.permalink = permalink
        self.thumbnail = thumbnail
    }
}

extension ProductInfo: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, title, price, condition, permalink, thumbnail
        case currency = "currency_id"
    }
    
    static func fromJSONString(_ jsonString: String) throws -> ProductInfo? {
        guard let jsonData = jsonString.data(using: .utf8) else { return nil }
        return try JSONDecoder().decode(ProductInfo.self, from: jsonData)
    }
}

extension ProductInfo: Identifiable {
    
}

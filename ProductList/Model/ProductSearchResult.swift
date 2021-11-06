//
//  ProductSearchResult.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import Foundation

struct ProductSearchResult {
    let query: String
    let products: [ProductInfo]
    
    init(query: String, products: [ProductInfo]) {
        self.query = query
        self.products = products
    }
}

extension ProductSearchResult: Decodable {
    enum CodingKeys: String, CodingKey {
        case query
        case products = "results"
    }
    
    static func fromJSONString(_ jsonString: String) throws -> ProductSearchResult? {
        guard let jsonData = jsonString.data(using: .utf8) else { return nil }
        return try JSONDecoder().decode(ProductSearchResult.self, from: jsonData)
    }
}

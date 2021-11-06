//
//  MercadoLibreProductListService.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import Foundation

class MercadoLibreProductListService: ProductListServiceProtocol {
    
    func searchProducts(text: String, completion: ([ProductInfo]) -> ()) {
        // TODO: get products
        completion(PreviewSampleData.products)
    }
    
}

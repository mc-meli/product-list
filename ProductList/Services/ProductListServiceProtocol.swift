//
//  ProductListServiceProtocol.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import Foundation

protocol ProductListServiceProtocol {
    
    func searchProducts(text: String, completion: @escaping (Result<ProductSearchResult, Error>) -> ())
    
}

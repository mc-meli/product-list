//
//  ProductListServiceProtocol.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import Foundation

/// Defines the services that the application uses to retreive products information
protocol ProductListServiceProtocol {
    
    /// Searchs for products that match the given search text
    ///
    /// The search result is passed to the completion block, or an error if the search failed for any reason
    ///
    /// - Parameters:
    ///    - text: the search text
    ///    - completion: the completion block to be called either with the results or the error
    func searchProducts(text: String, completion: @escaping (Result<ProductSearchResult, Error>) -> ())
    
}

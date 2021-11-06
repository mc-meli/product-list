//
//  MercadoLibreProductListService.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import Foundation

enum MercadoLibreProductListServiceError: Error {
    case couldNotCreateURL
    case httpStatusError
    case emptyResponse
    case couldNotGetJSONFromResponse
    case couldNotCreateProductsInfoFromResponse
}

/// Service implementation for Mercado Libre
class MercadoLibreProductListService: ProductListServiceProtocol {
    
    func searchProducts(text: String, completion: @escaping (Result<ProductSearchResult, Error>) -> ()) {
        guard
            let searchString = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let searchURL = URL(string: "https://api.mercadolibre.com/sites/MLU/search?q=\(searchString)")
        else {
            completion(.failure(MercadoLibreProductListServiceError.couldNotCreateURL))
            return
        }
        
        var urlRequest = URLRequest(url: searchURL)
        urlRequest.setValue("Bearer $ACCESS_TOKEN", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                completion(.failure(MercadoLibreProductListServiceError.httpStatusError))
                return
            }

            
            guard let data = data else {
                completion(.failure(MercadoLibreProductListServiceError.emptyResponse))
                return
            }
            
            guard let json = String(data: data, encoding: .utf8) else {
                completion(.failure(MercadoLibreProductListServiceError.couldNotGetJSONFromResponse))
                return
            }
            
            let searchResult = try? ProductSearchResult.fromJSONString(json)
            completion(.success(searchResult ?? ProductSearchResult(query: text, products: [])))
        }
        task.resume()
    }
    
}

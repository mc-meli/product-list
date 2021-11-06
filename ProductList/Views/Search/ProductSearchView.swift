//
//  ProductSearchView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

/// This is the applications entry point
///
/// It allows the user to search by any text, displays search results by pushing a ProductListView
struct ProductSearchView: View {
    @State private var searchText = ""
    @State private var readyToShowList = false
    @State private var searching = false
    @State private var lastSearchError: Error? = nil
    @State private var searchResult: ProductSearchResult? = nil
    
    let productListService: ProductListServiceProtocol
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Buscar productos")
                    .font(.title)
                
                TextField("Ingrese su búsqueda", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 10)
                
                if searching {
                    ProgressView("Buscando...")
                        .padding()
                }
                else {
                    NavigationLink(destination: ProductListView(searchResults: self.searchResult), isActive: $readyToShowList) {
                        Button {
                            searching = true
                            lastSearchError = nil
                            productListService.searchProducts(text: self.searchText) { result in
                                switch result {
                                case .success(let result):
                                    searchResult = result
                                    readyToShowList = true
                                case .failure(let error):
                                    lastSearchError = error
                                }
                                self.searching = false

                            }
                        } label: {
                            Text("Buscar")
                        }
                    }
                    .padding()
                }
                
                if lastSearchError != nil {
                    Text("Se produjo un error en la búsqueda, intente nuevamente más tarde")
                        .font(.body)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
            }
        }
    }
}

struct ProductSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSearchView(productListService: MercadoLibreProductListService())
    }
}

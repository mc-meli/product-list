//
//  ProductSearchView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

struct ProductSearchView: View {
    @State private var searchText = ""
    @State private var readyToShowList = false
    @State private var searching = false
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
                }
                else {
                    // TODO: pass the search results to the ProductListView
                    NavigationLink(destination: ProductListView(products: self.searchResult?.products ?? []), isActive: $readyToShowList) {
                        Button {
                            self.searching = true
                            productListService.searchProducts(text: self.searchText) { result in
                                switch result {
                                case .success(let result):
                                    self.searchResult = result
                                    readyToShowList = true
                                case .failure(let error):
                                    // TODO: handle error
                                    print(error)
                                }
                                self.searching = false

                            }
                        } label: {
                            Text("Buscar")
                        }
                    }
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

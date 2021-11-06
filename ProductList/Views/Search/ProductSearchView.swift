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
    @State private var products: [ProductInfo] = []
    
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
                    NavigationLink(destination: ProductListView(products: self.products), isActive: $readyToShowList) {
                        Button {
                            self.searching = true
                            productListService.searchProducts(text: self.searchText) { products in
                                self.products = products
                                self.searching = false
                                readyToShowList = true
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

//
//  ProductListView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

struct ProductListView: View {
    var searchResults: ProductSearchResult?
    
    var body: some View {
        List(searchResults?.products ?? []) { product in
            NavigationLink {
                ProductDetailView(product: product)
            } label: {
                ProductRowView(product: product)
            }
        }
        .navigationTitle("Productos")
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(searchResults: PreviewSampleData.searchResults)
    }
}

//
//  ProductListView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

struct ProductListView: View {
    var products: [ProductInfo]
    
    var body: some View {
        List(products) { product in
            ProductRowView(product: product)
        }
    }
}

let previewProducts = [
    ProductInfo(id: "Uno", title: "Producto uno", price: 100, currency: "UYU", condition: "used", permalink: URL(string: "http://www.google.com")!, thumbnail: URL(string: "https://e7.pngegg.com/pngimages/109/296/png-clipart-apple-logo-apple-heart-logo.png")!),
    ProductInfo(id: "Dos", title: "Producto dos", price: 80, currency: "UYU", condition: "used", permalink: URL(string: "http://www.google.com")!, thumbnail: URL(string: "https://e7.pngegg.com/pngimages/109/296/png-clipart-apple-logo-apple-heart-logo.png")!),
    ProductInfo(id: "Tres", title: "Producto tres", price: 5, currency: "USD", condition: "new", permalink: URL(string: "http://www.google.com")!, thumbnail: URL(string: "https://e7.pngegg.com/pngimages/109/296/png-clipart-apple-logo-apple-heart-logo.png")!)
]

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: previewProducts)
    }
}
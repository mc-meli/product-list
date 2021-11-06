//
//  ProductListApp.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

@main
struct ProductListApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView(products: PreviewSampleData.products)
        }
    }
}

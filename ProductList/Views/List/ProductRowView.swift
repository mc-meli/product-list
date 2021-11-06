//
//  ProductRowView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

/// Displays a single product in a product list
struct ProductRowView: View {
    var product: ProductInfo
    
    var body: some View {
        HStack {
            ProductImageView(withURL: product.thumbnail)
                .frame(width: 50, height: 50, alignment: .center)
            VStack {
                Text(product.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                HStack {
                    Text(product.displayCondition)
                        .font(.caption)
                    Text("\(product.displayPrice)")
                        .font(.caption)
                    Spacer()
                }
            }
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: PreviewSampleData.productInfo)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}

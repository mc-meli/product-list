//
//  ProductDetailView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

struct ProductDetailView: View {
    var product: ProductInfo
    
    @State private var showingAlert = false
    
    var body: some View {
            VStack {
                HStack(alignment: .top) {
                    ProductImageView(withURL: product.thumbnail.absoluteString)
                        .frame(width: 80)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Condición: \(product.displayCondition)")
                        Text("Precio: \(product.displayPrice)")
                    }
                    Spacer()
                }
                .padding()
                
                Button("Lo quiero!") {
                    showingAlert = true
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("¡Gracias por tu compra!")
                    )
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle(product.title)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: PreviewSampleData.productInfo)
    }
}

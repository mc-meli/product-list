//
//  ProductRowView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

struct ProductRowView: View {
    var product: ProductInfo
    
    var body: some View {
        HStack {
            ProductImageView(withURL: product.thumbnail.absoluteString)
                .frame(width: 50, height: 50, alignment: .center)
            VStack {
                Text(product.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                HStack {
                    Text(product.condition == "used" ? "Usado" : "Nuevo")
                        .font(.caption)
                    Text("\(product.currency) \(product.price)")
                        .font(.caption)
                    Spacer()
                }
            }
        }
    }
}

let previewProductInfo = ProductInfo(
    id: "MLU602962743",
    title: "Moto G6 Play (sin Tapa Trasera) Libre Oferta!!!",
    price: 1999,
    currency: "UYU",
    condition: "used",
    permalink: URL(string: "https://articulo.mercadolibre.com.uy/MLU-602962743-moto-g6-play-sin-tapa-trasera-libre-oferta-_JM")!,
    thumbnail: URL(string: "http://http2.mlstatic.com/D_776681-MLU47932898328_102021-O.jpg")!
)

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: previewProductInfo)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}

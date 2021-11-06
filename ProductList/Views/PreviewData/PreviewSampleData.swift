//
//  PreviewSampleData.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import Foundation

struct PreviewSampleData {
    
    static let thumbnailURLString = "http://http2.mlstatic.com/D_776681-MLU47932898328_102021-O.jpg"
    
    private static let appleLogoURL = URL(string: "https://e7.pngegg.com/pngimages/109/296/png-clipart-apple-logo-apple-heart-logo.png")!
    private static let appleURL = URL(string: "https://apple.com")!
    
    private static let products = [
        ProductInfo(id: "Uno", title: "Producto uno", price: 100, currency: "UYU", condition: "used", permalink: appleURL, thumbnail: appleLogoURL),
        ProductInfo(id: "Dos", title: "Producto dos", price: 80, currency: "UYU", condition: "used", permalink: appleURL, thumbnail: appleLogoURL),
        ProductInfo(id: "Tres", title: "Producto tres", price: 5, currency: "USD", condition: "new", permalink: appleURL, thumbnail: appleLogoURL)
    ]
    
    static let searchResults = ProductSearchResult(query: "Producto", products: products)
    
    static let productInfo = ProductInfo(
        id: "MLU602962743",
        title: "Moto G6 Play (sin Tapa Trasera) Libre Oferta!!!",
        price: 1999,
        currency: "UYU",
        condition: "used",
        permalink: URL(string: "https://articulo.mercadolibre.com.uy/MLU-602962743-moto-g6-play-sin-tapa-trasera-libre-oferta-_JM")!,
        thumbnail: URL(string: "http://http2.mlstatic.com/D_776681-MLU47932898328_102021-O.jpg")!
    )
    
}

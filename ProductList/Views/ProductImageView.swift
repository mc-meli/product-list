//
//  ProductImageView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

struct ProductImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString: url)
    }

    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

struct ProductImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductImageView(withURL: "http://http2.mlstatic.com/D_776681-MLU47932898328_102021-O.jpg")
    }
}
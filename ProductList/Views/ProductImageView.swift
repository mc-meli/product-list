//
//  ProductImageView.swift
//  ProductList
//
//  Created by Test on 6/11/21.
//

import SwiftUI

/// Displays a product's image given its URL
/// 
/// Downloads the image from the given URL and shows it when it's ready.
struct ProductImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()

    init(withURL url: URL) {
        imageLoader = ImageLoader(url: url)
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
        ProductImageView(withURL: PreviewSampleData.thumbnailURL)
    }
}

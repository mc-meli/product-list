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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Buscar productos")
                    .font(.title)
                
                TextField("Ingrese su búsqueda", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 10)
                
                NavigationLink(destination: ProductListView(products: PreviewSampleData.products), isActive: $readyToShowList) {
                    Button {
                        // TODO: start the search!
                        print("Button tapped")
                        
                        readyToShowList = true
                    } label: {
                        Text("Buscar")
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct ProductSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSearchView()
    }
}

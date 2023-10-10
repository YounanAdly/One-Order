//
//  CartScreen.swift
//  One Order
//
//  Created by younan on 11/10/2023.
//

import SwiftUI

struct CartScreen: View {
    
    var viewModel = ProductsViewModel()
    
    
    var body: some View {
        VStack {
            productList
            
            Spacer()
            
            Text("PAY \(viewModel.calculateTotalPrice()) EGP")
                .padding()
            
        }.navigationTitle("Cart")
    }
    
    var productList: some View {
        ScrollView{
            ForEach(viewModel.productsInCart,id: \.id) { position in
                CartCell(product: position)
            }
        }
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
    }
}

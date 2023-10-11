//
//  CartScreen.swift
//  One Order
//
//  Created by younan on 11/10/2023.
//

import SwiftUI

struct CartScreen: View {
    
    @ObservedObject var viewModel: ProductsViewModel

    
    var body: some View {
        VStack {
            clearListButton
            productList
            
            Spacer()
            
            Text("PAY \(viewModel.calculateTotalPrice()) EGP")
                .padding()
            
        }.navigationTitle("Cart")
    }
    
    var clearListButton: some View {
        VStack {
            Button {
                viewModel.productsInCart.removeAll()
            } label: {
                Text("Clear")
                    .padding()
                    .foregroundColor(Color.black)
                    .background(customBlackStroke(width: 60, height: 30))
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    
            }
        }
    }
    
    var productList: some View {
        ScrollView{
            ForEach(viewModel.productsInCart,id: \.id) { position in
                CartCell(product: position)
            }
        }
    }
    
    func customQuantityButton(imageName: String) -> some View {
        ZStack {
            Image(systemName: imageName)
                .foregroundColor(Color.black)
                .background(customBlackStroke(width: 25, height: 25))
                .frame(width: 25, height: 25)
        }
    }
    
    func customBlackStroke(width: Int,height: Int) -> some View {
        ZStack {
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
                .frame(width: CGFloat(width), height: CGFloat(height))
        }
    }
    
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen(viewModel: ProductsViewModel())
    }
}

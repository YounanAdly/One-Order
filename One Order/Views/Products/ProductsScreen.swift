//
//  ContentView.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import SwiftUI

struct ProductsScreen: View {
    
    @StateObject var viewModel = ProductsViewModel()
    
    
    var body: some View {
        VStack{
            headerToolbar
            productList
            
            Spacer()
        }
    }
    
    var headerToolbar: some View {
        HStack(alignment:.top) {
            Text("Shop")
                .frame(maxWidth: .infinity, alignment: .top)
            
            
            Button {
                
            } label: {
                Image(systemName: "cart")
                    .padding(.trailing,22)
                    .frame(width: 12,height: 12,
                           alignment: .topTrailing)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .top)
    }
    
    var productList: some View {
        ScrollView{
            
            ForEach(viewModel.mProducts,id: \.id) { position in
                ProductCell(product: position)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsScreen()
    }
}

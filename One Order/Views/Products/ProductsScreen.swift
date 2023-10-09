//
//  ContentView.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import SwiftUI

struct ProductsScreen: View {
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
            
            ForEach(0..<6) { product in
                ProductCell()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsScreen()
    }
}

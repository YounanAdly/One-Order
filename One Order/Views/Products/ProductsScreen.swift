//
//  ContentView.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import SwiftUI

struct ProductsScreen: View {
    
    @StateObject var viewModel = ProductsViewModel()
    @State var openCart: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                headerToolbar
                productList
                
                Spacer()
            }
            .alert(isPresented: $viewModel.isAlert) {
                Alert(title: Text("Error"),
                      message: Text(viewModel.errorMessage ?? "Somthing went wrong"),
                      dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $viewModel.isProductAdded) {
                Alert(title: Text("Add Product"),
                      message: Text(viewModel.addMsg),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    
    var headerToolbar: some View {
        HStack(alignment:.top) {
            Text("Shop")
                .frame(maxWidth: .infinity, alignment: .top)
            
            
            
            
            NavigationLink(destination: CartScreen(viewModel: viewModel)) {
                Image(systemName: "cart")
                    .foregroundColor(Color.black)
                    .padding(.trailing,22)
                    .frame(width: 25,height: 25,
                           alignment: .topTrailing)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .top)
    }
    
    var productList: some View {
        ScrollView{
            ForEach(viewModel.mProducts,id: \.id) { position in
                ProductCell(vm: viewModel, product: position)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsScreen()
    }
}

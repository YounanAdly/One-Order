//
//  ProductViewModel.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import Foundation

class ProductsViewModel : ObservableObject {
    
    let repo = ProductRepo()
    
    @Published var isLoading : Bool = false
    @Published var isAlert : Bool = false
    @Published var isSuccess : Bool = false
    @Published var errorMessage : String? = nil
    @Published var mProducts  = [ProductData]()
    
    
    init(){
        getProducts()
    }
    
    
    func getProducts() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let response = try await repo.getProducts()
                await updateUI(products: response)
                print("Products: \(response)")
            } catch {
                await errorUpdateUI(error: error)
                print(error)
            }
        }
    }
    
    @MainActor
    func updateUI(products: [ProductData]) {
        isLoading = false
        isSuccess = true
        mProducts = products
    }
    
    @MainActor
    func errorUpdateUI(error : Error){
        isLoading = false
        isAlert = true
        errorMessage = error.localizedDescription
    }
}


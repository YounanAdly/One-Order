//
//  ProductViewModel.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import Foundation

class ProductsViewModel : ObservableObject {
    
    let repo = ProductRepo()
    
    @Published var isLoading: Bool = false
    @Published var isAlert: Bool = false
    @Published var isSuccess: Bool = false
    @Published var errorMessage: String? = nil
    @Published var mProducts = [ProductData]()
    
    // Cart
    @Published var productsInCart: [ProductData] = []
    @Published var isProductAdded: Bool = false
    @Published var addMsg: String = ""
    
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
    
    
    
    func addToCart(product: ProductData,quantity: Int) {
        addCartValidation(product: product,quantity: quantity)
    }
    
    
    func addCartValidation(product: ProductData,quantity: Int) {
        
        if !productsInCart.contains(where: { $0.id == product.id }) {
            
            updateQuantityBeforAdd(product: product, quantity: quantity)
            showMessage("Product added to cart.")
            
        } else {
            showMessage("Product is already in the cart.")
        }
    }
    
    
    func updateQuantityBeforAdd(product: ProductData,quantity: Int) {
        var productCopy = product
        productCopy.quantity = quantity
        productsInCart.append(productCopy)
    }
    
    func calculateTotalPrice() -> Double {
        var totalPrice = 0.0
        for product in productsInCart {
            if let quantity = product.quantity {
                totalPrice += Double(quantity) * product.price
            }
        }
        return totalPrice
    }
    
    /// UI Update
    
    func showMessage(_ message: String) {
        isProductAdded = true
        addMsg = message
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


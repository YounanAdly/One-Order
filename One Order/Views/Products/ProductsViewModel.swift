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
    
    
    init(){getProducts()}
    
    func getProducts() {
        
        isLoading = true
        errorMessage = nil
        
        repo.getProducts(url: getProductsRequest()) { [weak self] result in
            
            DispatchQueue.main.async {
                self?.isLoading = false
                self?.isAlert = false
                self?.isSuccess = false
                
                switch result {
                case .failure(let error):
                    self?.isAlert = true
                    self?.errorMessage = error.localizedDescription
                    print(error)
                case .success(let response):
                    self?.isSuccess = true
                    self?.mProducts = response
                    print("Products===== \(response)")
                }
            }
        }
    }
    
    
    
    
    func getProductsRequest()  -> URLRequest {
        isLoading = true
        
        let url = URL(string: APIManager.shared.getProducts())!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    
}

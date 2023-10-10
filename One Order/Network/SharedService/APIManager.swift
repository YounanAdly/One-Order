//
//  ConstantLink.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    let baseURL = "https://fakestoreapi.com/"
    
    func getProducts() -> String {
        return "products"
    }
}

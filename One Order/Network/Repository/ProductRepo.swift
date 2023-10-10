//
//  ProductService.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import Foundation

struct ProductRepo {
    
    let service = ApiService()
    
    func getProducts() async throws -> [ProductData] {
        let request = ProductsAPIRequest()
        return try await service.fetch(request)
    }
    
}

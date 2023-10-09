//
//  ProductService.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import Foundation

struct ProductRepo {
    
    let service = ApiService()
    
    func getProducts(url: URLRequest?, completion: @escaping (Result<[ProductData], ApiError>) -> Void) {
        service.fetch([ProductData].self, url: url, completion: completion)
    }
}

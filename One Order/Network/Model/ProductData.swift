//
//  ProductData.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import Foundation

struct ProductData: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: ProductRating
    
    
    init(){
        self.id = 0
        self.title = "Product Title"
        self.price = 0
        self.description = "Product Description"
        self.category = "Product Category"
        self.image = ""
        self.rating = ProductRating()
    }
}

struct ProductRating: Codable {
    let rate: Double
    let count: Int
    
    init(){
        self.rate = 0.0
        self.count = 0
    }
}

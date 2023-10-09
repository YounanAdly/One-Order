//
//  ProductData.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import Foundation

struct ProductData: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    
}

struct ProductRating: Codable {
    let rate: Double
    let count: Int
}

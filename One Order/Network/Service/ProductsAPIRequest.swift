//
//  ProductsAPIRequest.swift
//  One Order
//
//  Created by younan on 10/10/2023.
//

import Foundation

struct ProductsAPIRequest: APIRequest {
    var path: String { return APIManager.shared.getProducts() }
    var httpMethod: HTTPMethod { return .get }
}

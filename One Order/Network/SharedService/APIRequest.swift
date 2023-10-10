//
//  APIRequest.swift
//  One Order
//
//  Created by younan on 10/10/2023.
//

import Foundation

protocol APIRequest {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any]? { get }
    var bodyModel: [String: Any]? { get }
    
    func build() -> URLRequest
}

extension APIRequest {
    var baseUrl: String { return APIManager.shared.baseURL }
    var headers: [String: String] {
        var defaultHeaders = [String: String]()
        defaultHeaders["Content-Type"] = "application/x-www-form-urlencoded"
        return defaultHeaders
    }
    
    var parameters: [String: Any]? { return nil }
    var bodyModel: [String: Any]? { return nil }
    
    func build() -> URLRequest {
        let urlString = baseUrl + path
        guard let url = URL(string: urlString) else {
            fatalError(ApiError.badUrl.localizedDescription)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = buildBodyModel()
        request.allHTTPHeaderFields = buildHeader()
        return request
    }
    
    private func buildHeader() -> [String: String] {
        let requestHeaders = headers
        return requestHeaders
    }
    
    private func buildBodyModel() -> Data? {
        guard let bodyModel = bodyModel else { return nil }
        var bodyString = ""
        for (key, value) in bodyModel {
            bodyString.append("\(key)=\(value)&")
        }
        bodyString = String(bodyString.dropLast()) // Remove the trailing "&"
        return bodyString.data(using: .utf8)
    }
}

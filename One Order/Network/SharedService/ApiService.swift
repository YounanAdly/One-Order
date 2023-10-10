//
//  ApiService.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//


import Foundation

struct ApiService {
    
    func fetch<T: Decodable>(_ request: APIRequest) async throws -> T {
        guard let url = request.build().url else {
            throw ApiError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw ApiError.badResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }
        
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw ApiError.parsing(error as? DecodingError)
        }
    }
    
}

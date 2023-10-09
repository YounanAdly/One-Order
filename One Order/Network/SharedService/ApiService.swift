//
//  ApiService.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//


import Foundation

struct ApiService {
    
    func fetch<T: Decodable> (_ type : T.Type, url: URLRequest?, completion: @escaping(Result<T,ApiError>) -> Void) {
        guard let url = url else {
            let error = ApiError.badUrl
            return  completion(Result.failure(error))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(ApiError.url(error)))
            } else if let response = response as? HTTPURLResponse,
                      !(200...500).contains(response.statusCode) {
                completion(Result.failure(ApiError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                }catch {
                    completion(Result.failure(ApiError.parsing(error as? DecodingError)))
                }
                
            }
        }
        task.resume()
    }

}

//
//  ApiError.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import Foundation

enum ApiError : Error , CustomStringConvertible {
    case badUrl
    case badResponse(statusCode : Int)
    case url (URLError?)
    case parsing(DecodingError?)
    case unknown
    
    
    var localizedDescription : String {
        switch self {
        case .badUrl, .parsing,.unknown :
            return "Sorry, Error in Parsing."
        case .badResponse(_):
            return "Sorry, the connection to our server failed."
        case .url(let error) :
            return error?.localizedDescription ?? "Somthing went wrong"
            
        }
    }
    
    
    var description: String {
        switch self {
        case .unknown: return "unknown error"
        case .badUrl: return "invalid URL"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "Parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad Response with status code \(statusCode)"
        }
    }
}

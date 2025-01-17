//
//  HTTPRequestHelper.swift
//  MVVMExampleUsingAsyncAwait
//
//  Created by Nitin Bhatt on 18/01/25.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case serverError(statusCode: Int)
    case decodingError
    case networkError(Error)
    case unknown
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .serverError(let statusCode):
            return "Server returned an error with status code: \(statusCode)."
        case .decodingError:
            return "Failed to decode the data."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse, .unknown :
            return "Something went wrong please try again later"
        }
    }
}

class HTTPRequestHelper {
    
    func getRequest(path: String, method: String? = "GET") async throws -> Data {
        guard let components = URLComponents(string: path) else {
            throw APIError.invalidURL
        }
        
        guard let url = components.url else{
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
                
        guard (200..<300) ~= httpResponse.statusCode else {
            throw APIError.serverError(statusCode: httpResponse.statusCode)
        }
        
        return data
    }
}

//
//  APIEnviroment.swift
//  MVVMExampleUsingAsyncAwait
//
//  Created by Nitin Bhatt on 18/01/25.
//
enum APIEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
        return "https://\(domain())"
    }
        
    func domain() -> String {
        switch self {
        case .development:
            return "jsonplaceholder.typicode.com"
        case .staging:
            return "jsonplaceholder.typicode.com"
        case .production:
            return "jsonplaceholder.typicode.com"
        }
    }
}

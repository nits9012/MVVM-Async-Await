//
//  APIPath.swift
//  MVVMExampleUsingAsyncAwait
//
//  Created by Nitin Bhatt on 18/01/25.
//
#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

struct APIPath {
    var users: String { return "\(baseURL)/users"}
}

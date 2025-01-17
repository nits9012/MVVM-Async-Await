//
//  ContactService.swift
//  MVVMExampleUsingAsyncAwait
//
//  Created by Nitin Bhatt on 18/01/25.
//

import Foundation

protocol ContactServiceProtocol {
    func getContact() async -> Result<[Contact], APIError>
}

class ContactService: ContactServiceProtocol {
    var request: HTTPRequestHelper
    
    init(request: HTTPRequestHelper) {
        self.request = request
    }
    
    func getContact() async -> Result<[Contact], APIError> {
        do {
            // Fetch the raw data from the API
            let data = try await request.getRequest(path: APIPath().users)
            // Try to decode the fetched data into an array of Contacts
            let contacts = try JSONDecoder().decode([Contact].self, from: data)
            // If successful, return the result as .success
            return  .success(contacts)
        } catch let error as APIError {
            // If the error is an APIError, return it
            return .failure(error)
        } catch {
            // If the error is not of type APIError, return a generic decoding error
            return .failure(.decodingError)
        }
    }
}

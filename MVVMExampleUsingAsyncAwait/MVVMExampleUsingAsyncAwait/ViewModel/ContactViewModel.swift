//
//  ContactViewModel.swift
//  MVVMExampleUsingAsyncAwait
//
//  Created by Nitin Bhatt on 18/01/25.
//

import Foundation

@MainActor
class ContactViewModel : ObservableObject {
    
    @Published var contacts: [Contact] = []
    @Published var errorMessage:String?
    
    private var contactService: ContactServiceProtocol
    
    var fetchContactTask: Task<Void,Never>? = nil
    
    // Dependency Injection to make the ViewModel testable and reusable
    init(service: ContactServiceProtocol = ContactService(request: HTTPRequestHelper())) {
        self.contactService = service
    }
    
    func cancelTask() {
        fetchContactTask?.cancel()
    }
    
    func fetchContacts() {
        fetchContactTask = Task {
            let results = await self.contactService.getContact()
            switch results {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .success(let contacts) :
                self.contacts = contacts
            }
        }
    }
}

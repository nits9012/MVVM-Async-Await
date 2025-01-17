//
//  ContactView.swift
//  MVVMExampleUsingAsyncAwait
//
//  Created by Nitin Bhatt on 18/01/25.
//

import SwiftUI

struct ContactView: View {
    @StateObject var viewModel = ContactViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage) // Show an error message if fetching fails
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.contacts) { contact in
                        ContactListRowView(contact: contact)
                    }
                }
            }
        }.onAppear() {
            viewModel.fetchContacts()
        }.onDisappear() {
            viewModel.cancelTask()
        }
    }
}

#Preview {
    ContactView()
}

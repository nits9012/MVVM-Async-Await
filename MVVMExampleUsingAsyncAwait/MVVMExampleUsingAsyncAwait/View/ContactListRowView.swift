//
//  ContactListRowView.swift
//  MVVMExampleUsingAsyncAwait
//
//  Created by Nitin Bhatt on 18/01/25.
//

import SwiftUI

struct ContactListRowView: View {
    let infoImage = "info"
    
    var contact: Contact
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading){
                Text(contact.name).font(.headline)
                Text(contact.address.city).font(.subheadline)
            }
            Spacer()
            Image(systemName: infoImage)
                .frame(width: 25, height: 25)
                .background(Circle().fill(Color.gray))
        }
    }
}

//
//  Contact.swift
//  MVVMExampleUsingAsyncAwait
//
//  Created by Nitin Bhatt on 18/01/25.
//
/// Main User Model
struct Contact: Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}

struct Company: Codable {
    var name: String?
    var catchPhrase: String?
    var bs: String?
}

/// Address Model
struct Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo?
}

struct Geo: Codable {
    var lat: String
    var lng: String
}

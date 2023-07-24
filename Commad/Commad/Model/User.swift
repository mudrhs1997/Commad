//
//  User.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

struct User: Codable {
    let id: Int
    let uid: String
    let password: String
    let first_name: String
    let last_name: String
    let username: String
    let email: String
    let avatar: String
    let gender: String
    let phone_number: String
    let social_insurance_number: String
    let date_of_birth: String
    let employment: Employment
    let address: Address
    let credit_card: CreditCard
    let subscription: Subscription
}

struct Employment: Codable {
    let title: String
    let key_skill: String
}

struct Coordinates: Codable {
    let lat: Double
    let lng: Double
}

struct Address: Codable {
    let city: String
    let street_name: String
    let street_address: String
    let zip_code: String
    let state: String
    let country: String
    let coordinates: Coordinates
}

struct CreditCard: Codable {
    let cc_number: String
}

struct Subscription: Codable {
    let plan: String
    let status: String
    let payment_method: String
    let term: String
}

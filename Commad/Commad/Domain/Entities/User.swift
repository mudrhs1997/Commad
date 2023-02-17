//
//  HomeDTO.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/02.
//

import Foundation

struct User: Codable {
    typealias Identifier = String
    
    let id: Int
    let userName: String?
    let userBirthDay: String?
    let userPhoneNumber: String?
}

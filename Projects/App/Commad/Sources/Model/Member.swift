//
//  User.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

struct Member: Codable {
    let id: UUID
    let name: String
    let nickname: String
    let type: String
}

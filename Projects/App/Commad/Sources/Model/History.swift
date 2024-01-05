//
//  History.swift
//  Commad
//
//  Created by 정명곤 on 1/4/24.
//  Copyright © 2024 commad. All rights reserved.
//

import Foundation

struct History: Codable {
    let id: UUID
    let memberId: UUID
    let historyDate: String
    let delete: Bool
}

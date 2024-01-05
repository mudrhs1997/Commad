//
//  EndPoint.swift
//  Commad
//
//  Created by 정명곤 on 11/30/23.
//  Copyright © 2023 aodrhs. All rights reserved.
//

import Foundation

enum Endpoint {
    case history
    case checkIn
    case memberList
    
    var endpoint: String {
        switch self {
        case .history: return "/history/one"
        case .checkIn: return "/history"
        case .memberList: return "/member/info"
        }
    }
}

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
    case memberList
    case memberhistory
    
    var endpoint: String {
        switch self {
        case .history: return "/history/one"
        case .memberList: return "/member/info"
        case .memberhistory: return "/member/history"
        }
    }
}

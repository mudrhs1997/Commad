//
//  EndPoint.swift
//  Commad
//
//  Created by 정명곤 on 11/30/23.
//  Copyright © 2023 aodrhs. All rights reserved.
//

import Foundation

enum Endpoint {
    case userList
    
    var endpoint: String {
        switch self {
        case .userList: return "/user/list"
        }
    }
}

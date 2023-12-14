//
//  MainSceneModels.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

enum MainModels {
    enum Title: String, CaseIterable {
        case enter = "ENTER"
        case notice = "NOTICE"
        case manage = "MANAGE"
    }
    // MARK: Use cases
    enum Members {
        struct Request {
            var count: Int
        }
        
        struct Response {
            var members: [Member]?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var members: [Member]
        }
    }
}

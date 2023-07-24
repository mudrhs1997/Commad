//
//  MainSceneModels.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

enum MainModels {
    // MARK: Use cases
    enum Member {
        struct Request {
            var count: Int
        }
        
        struct Response {
            var users: [User]?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var users: [User]
        }
    }
}

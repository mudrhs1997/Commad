//
//  MemberModels.swift
//  Commad
//
//  Created by 정명곤 on 2023/08/01.
//

import Foundation

enum MemberListModels {
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

//
//  RequestBuilder.swift
//  Commad
//
//  Created by 정명곤 on 11/30/23.
//  Copyright © 2023 aodrhs. All rights reserved.
//

import Foundation

final class RequestBuilder {
    private var targetURL: URL?
    private var param: String?
    private var httpMethod: HTTPMethod?
    private var body: Data?
    private var headers: [String: String]? = ["Content-Type": "application/json"]
    
    func url(url: URL) -> Self {
        self.targetURL = url
        return self
    }

    func method(_ method: HTTPMethod) -> Self {
        self.httpMethod = method
        return self
    }
    
    func header() -> Self {
        return self
    }
    
    func body(_ body: [String: Any]) -> Self {
        let sendData = try! JSONSerialization.data(withJSONObject: body, options: [])
        self.body = sendData
        return self
    }

    func create() -> URLRequest {
        var request = URLRequest(url: targetURL!)
        
        if let httpMethod = httpMethod, let body = body, let headers = headers {
            request.httpMethod = httpMethod.rawValue.uppercased()
            request.httpBody = body
            request.allHTTPHeaderFields = headers
        }

        return request
    }
}

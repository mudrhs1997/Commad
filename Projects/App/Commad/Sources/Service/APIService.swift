//
//  APIService.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation
import Combine

enum APIError: Error {
    case data
    case decodingJSON
}

class APIService {
    
    func fetchMembers() -> AnyPublisher<[Member], Error> {
        return NetworkService.shared.get(to: .memberList)
            .tryMap { data, response in
                print(String(data: data, encoding: .utf8))
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("http error")
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Member].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


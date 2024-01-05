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
    
    func memberHistory(member: Member, year: String, month: String) -> AnyPublisher<[History], Error> {
        let params = [
            "id": member.id,
            "year": year,
            "month": month
        ] as [String: Any]
        
        return NetworkService.shared.get(to: .history, params: params)
        .tryMap { data, response in
            print(String(data: data, encoding: .utf8))
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            return data
        }
        .decode(type: [History].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
    
    func checkIn(member: Member) -> AnyPublisher<History, Error> {
        let params = [
            "id": member.id
        ] as [String: Any]
        
        return NetworkService.shared.post(to: .checkIn, param: params)
            .tryMap { data, response in
                print(String(data: data, encoding: .utf8))
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: History.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


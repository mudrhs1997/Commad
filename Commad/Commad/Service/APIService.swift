//
//  APIService.swift
//  Commad
//
//  Created by 정명곤 on 2023/07/04.
//

import Foundation

enum APIError: Error {
    case data
    case decodingJSON
}

class APIService {
    let session = URLSession(configuration: .default)
    
    func fetchAllMember(completion: @escaping (Result<[Member], APIError>) -> Void) {
        
        guard let url = URL(string: "https://random-data-api.com/api/v2/users?size=8") else { return }
        
        session.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                return completion(.failure(.data))
            }
            
            guard let members = try? JSONDecoder().decode([Member].self, from: data) else {
                return completion(.failure(.decodingJSON))
            }
            
            completion(.success(members))
            
        }.resume()
    }
}

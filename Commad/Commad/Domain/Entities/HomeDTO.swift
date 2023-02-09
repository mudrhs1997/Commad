//
//  HomeDTO.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/02.
//

import Foundation
import Firebase

struct HomeDTO: Codable {
    let entrancePeople: PeopleDTO
    
    enum CodingKeys: String, CodingKey {
        case entrancePeople = "entrance-people"
    }
}

struct PeopleDTO: Codable {
    let people: [String]
    
    enum CodingKeys: String, CodingKey {
        case people
    }
}

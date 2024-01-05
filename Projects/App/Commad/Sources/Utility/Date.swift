//
//  Date.swift
//  Commad
//
//  Created by 정명곤 on 1/4/24.
//  Copyright © 2024 commad. All rights reserved.
//

import Foundation

enum DateType {
    case year
    case month
    case day
}

extension Date {
    func getToday(type: DateType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        
        switch type {
        case .year: dateFormatter.dateFormat = "yyyy"
        case .month: dateFormatter.dateFormat = "MM"
        case .day: dateFormatter.dateFormat = "dd"
        }
        
        return dateFormatter.string(from: Date())
    }
}

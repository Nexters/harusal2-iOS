//
//  DateFomatter.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/18.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class Converter{
    static let shared = Converter()
    var formatter = DateFormatter()
    
    init() {
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone.autoupdatingCurrent
//        formatter.timeStyle = .none
    }
    
    func convertDate(_ date: Date) -> String{
        let str = formatter.string(from: date)
        return str
    }
    
    func convertString(_ str: String) -> Date{
        let date = formatter.date(from: str) ?? Date()
        return date
    }
    
}

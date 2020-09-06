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
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        formatter.timeStyle = .none
    }
    
    func convertDate(_ date: Date) -> String{
        let str = formatter.string(from: date)
        return str
    }
    
    func getLastDay(month: Int) -> Int {
        var lastDate = 0
        switch month {
        case 2 :
            lastDate = 29
        case 4, 6, 9, 11 :
            lastDate = 30
        default :
            lastDate = 31
        }
        
        return lastDate
    }
    
    func getDateNight(_ date: Date) -> Date{
        let calendar = Calendar.current
        let newDate = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        
        return newDate
    }
    
    func getDateZero(_ date: Date) -> Date{
        let str = convertDate(date)
        let newDate = convertString(str)
        return newDate
    }
    
    func convertString(_ str: String) -> Date{
        let date = formatter.date(from: str) ?? Date()
        return date
    }
    
}

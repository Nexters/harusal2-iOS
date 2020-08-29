//
//  DateFomatter.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/18.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class Converter{
    let formatter = DateFormatter()
    
    func convertDate(_ date: Date) -> String{
        formatter.dateFormat = "yyyy-MM-dd"
        
        let str = formatter.string(from: date)
        
        return str
    }
    
    func convertString(_ str: String) -> Date{
        formatter.dateFormat = "yyyy-MM-dd"
        
        let date = formatter.date(from: str) ?? Date()
        return date
    }
    
}

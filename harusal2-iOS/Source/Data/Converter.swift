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
    
    func convertDate(_ today: Date) -> String{
        formatter.dateFormat = "yyyy-MM-dd"
        
        let str = formatter.string(from: today)
        
        return str
    }
    
}

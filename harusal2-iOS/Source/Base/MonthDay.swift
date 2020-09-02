//
//  MonthDay.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

struct MonthDay {
    let month = [1,2,3,4,5,6,7,8,9,10,11,12]
    let day = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    
    func getDayOfMonth(month: Int) -> Int{
        return day[month]
    }
    
}

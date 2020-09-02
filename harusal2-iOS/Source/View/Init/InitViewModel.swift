//
//  InitViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/01.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class InitViewModel{
    
    var money: Int = 0
    var startDay: Int = 0
    var endDay:Int = 0
    var today: Int
    init() {
        today = Int(Converter.shared.convertDate(Date()).split(separator: "-").last.map{
        String($0)
        } ?? "0")!
    }
    
}

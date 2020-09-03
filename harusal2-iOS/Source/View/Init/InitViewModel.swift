//
//  InitViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/01.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class InitViewModel{
    
    var budget : Budget?
    var today: Int
    
    init() {
        today = Int(Converter.shared.convertDate(Date()).split(separator: "-").last.map{
        String($0)
        } ?? "0")!
    }
    
    func setStartDate(date: Date){
        budget?.startDate = Converter.shared.convertDate(date)
    }
    
}

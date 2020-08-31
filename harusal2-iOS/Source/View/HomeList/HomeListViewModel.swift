//
//  HomeListViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation


class HomeListViewModel{
    
    var breakDownList : [BreakDown] = []
    var today : Int = 0
    
    init() {
        //화면 켜질 때 데이터 불러오기
        
        today = Int(Converter.shared.convertDate(Date()).split(separator: "-").last.map{
            String($0)
            } ?? "0") ?? 0
    
    }
    
//    func leftMonthMoney() -> Int{
//
//    }
    
    func getDailyData(day: Int) -> [BreakDown] {
        let todayData : [BreakDown] = breakDownList.filter {
            return day == Int($0.date.split(separator: "-")[2])
        }
        
        return todayData
    }
    
}

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
    var budget: Budget = Budget()
    let db = DBRepository.shared // 싱글톤
    
    init() {
        today = Int(Converter.shared.convertDate(Date()).split(separator: "-").last.map{
            String($0)
            } ?? "0") ?? 0
    }
    
//    func leftMonthMoney() -> Int{
//
//    }
    
    func getMonthData(refresh: @escaping () -> ()){
        breakDownList = db.readMonthData()
        //Add BreakDown을 한 뒤에 firstCV의 reload()
        DispatchQueue.main.async {
            refresh()
        }
    }
    
    func getDailyData(day: Int) -> [BreakDown] {
        let todayData : [BreakDown] = breakDownList.filter {
            return day == Int($0.date.split(separator: "-")[2])
        }
        return todayData
    }
    
    func getDailyOutCome(day: Int) -> Int{
       let amount = self.getDailyData(day: day).filter{
                  return $0.type == 0
              }.map{data -> Int in
                  return data.amount
              }.reduce(0) {
                  $0 + $1
              }
              return amount
    }
    
    func getDailyInCome(day: Int) -> Int{
         let amount = self.getDailyData(day: day).filter{
                   return $0.type == 1
               }.map{data -> Int in
                   return data.amount
               }.reduce(0) {
                   $0 + $1
               }
               return amount
    }
    
    func getLatestBudget() -> String{
        self.budget = db.readLatestBudget() ?? Budget()
        let monthList = db.readMonthData()
        
        let monthIncome: Int = monthList.filter{
            $0.type == 1
        }.reduce(0) { (a: Int, b: BreakDown) -> Int in
            return a + b.amount
        }
        let monthOutcome: Int = monthList.filter{
            $0.type == 0
        }.reduce(0) { (a: Int, b: BreakDown) -> Int in
            return a + b.amount
        }
        
        print("Income -> \(monthIncome) , Outcome -> \(monthOutcome)")
        
        let todayMoney = budget.money/budget.termDay
        let monthInOut = todayMoney - monthOutcome+monthIncome
        
        return separateMoney(moneyStr: String(monthInOut))
    }
    
    func separateMoney(moneyStr: String) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        
        if let formattedNumber = formatter.number(from: moneyStr), let formattedString = formatter.string(from: formattedNumber){
            return formattedString
        }else{
            return ""
        }
    }
    
}

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
    var selectBudget: Budget?
    let db = DBRepository.shared // 싱글톤
    
    
    
    
    init() {
//        today = 30
        today = Int(Converter.shared.convertDate(Date()).split(separator: "-").last.map{
            String($0)
            } ?? "0") ?? 0
    }
    
    func getCellNum() -> Int{
        let startMonth = Int(String(Converter.shared.convertDate(budget.startDate).split(separator: "-")[1]))!
        let startDay = Int(String(Converter.shared.convertDate(budget.startDate).split(separator: "-")[2]))!
        var cellNum = today
        if today < startDay{
            cellNum += getLastDay(month: startMonth)
        }
        
        return cellNum - startDay + 1
        
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
    
    func getMonthData(refresh: ()->()){
        breakDownList = db.readMonthData(startDate: budget.startDate, endDate: budget.endDate)
        refresh()
    }
    
    func getDailyData(day: Int) -> [BreakDown] {
        let todayData : [BreakDown] = breakDownList.filter {
            return day == Int(Converter.shared.convertDate($0.date).split(separator: "-")[2])
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
    
    func getLatestBudget(refresh: (()-> ())?){
        if self.selectBudget == nil{
            self.budget = db.readLatestBudget() ?? Budget()
            print(self.budget)
        }else{
            self.budget = selectBudget!
            selectBudget = nil
        }
        refresh?()
        
       
    }
    
    func getMoneyInOut() -> String{
        let monthList = db.readMonthData(startDate: budget.startDate, endDate: budget.endDate)
               
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
               
               
        if budget.termDay != 0{
               let todayMoney = budget.money/budget.termDay
               let monthInOut = todayMoney - monthOutcome+monthIncome
               
               
               return separateMoney(moneyStr: String(monthInOut))
        }
        
        return "0"
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
    
    func separateDate(date: Date) -> String{
        let strDate = Converter.shared.convertDate(date)
        var str = strDate.split(separator: "-").reduce("") { (first, second) -> String in
            return first + "." + second
        }
        str.removeFirst()
        return str
    }
    
    func separateMonthDay(date: Date) -> String{
        let strDate = Converter.shared.convertDate(date)
        let str: String = strDate.split(separator: "-")[1] + "." + strDate.split(separator: "-")[2]
        return str
    }
    
    func getHeaderDay(index: Int) -> Int{
        if today - index > 0{
            return today - index
        }else{
            let lastMonthDay = self.budget.termDay + today
            return lastMonthDay - index
        }
    }
    
}

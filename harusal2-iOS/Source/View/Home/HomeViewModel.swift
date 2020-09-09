//
//  HomeViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class HomeViewModel{
    
    var breakDownList : [BreakDown] = []
    var todayList: [BreakDown] = []
    var budget: Budget?
    var updateHeaderUI : ((String, String) -> Void)?
    var moneyData: (Int,Int) = (0,0)
    let db = DBRepository.shared // 싱글톤
    
    func getMode() -> String{
        let percentMoney =  moneyData.0/100
        var mode : String = ""
        if percentMoney != 0{
            if moneyData.1 <= -percentMoney*15{
                mode =  "Worst"
            }else if moneyData.1 <= -percentMoney*10 && moneyData.1 > -percentMoney*15{
                mode =  "VeryBad"
            }else if moneyData.1 <= -percentMoney*5 && moneyData.1 > -percentMoney*10{
                mode =  "Bad"
            }else if moneyData.1 <= percentMoney*5 && moneyData.1 > -percentMoney*5{
                mode =  "Normal"
            }else if moneyData.1 <= percentMoney*10 && moneyData.1 > percentMoney*5{
                mode =  "Good"
            }else{
                mode =  "VeryGood"
            }
        } else {
            mode = "Normal"
        }
        return mode
    }
    
    func getAllData(refresh: @escaping () -> ()){
        breakDownList = db.readAllData()
    
        DispatchQueue.main.async {
            refresh()
        }
    }
    
    func getTodayData(refresh: @escaping () -> ()){
        breakDownList = db.readTodayDate()
        
        DispatchQueue.main.async {
            refresh()
        }
    }
    
    func getLatestBudget(){
        self.budget = db.readLatestBudget()
        if self.budget != nil{
            moneyData = getMonthInOut()
            let todayMoney = moneyData.0
            let monthInOut = moneyData.1
            updateHeaderUI?(separateMoney(moneyStr: String(todayMoney)), separateMoney(moneyStr: String(monthInOut)))
        }else{
            updateHeaderUI?(separateMoney(moneyStr: "0"), separateMoney(moneyStr: "0"))
        }
    }
    
    func getMonthInOut() -> (Int,Int){
        guard let budget = self.budget else{
            return (0,0)
        }
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
        
            let todayMoney = budget.money/budget.termDay
            let monthInOut = todayMoney - monthOutcome+monthIncome
            return (todayMoney,monthInOut)
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

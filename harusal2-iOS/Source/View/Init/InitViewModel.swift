//
//  InitViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/01.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class InitViewModel{
    
    var budget : Budget = Budget()
    var today: Int
    let db = DBRepository.shared
    var values: [Int] = []
    lazy var monthAndDay = getMonthAndDay(date: Date())
    
    init() {
        today = Int(Converter.shared.convertDate(Date()).split(separator: "-").last.map{
        String($0)
        } ?? "0")!
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
    
    func getMonthAndDay(date: Date)-> (Int,Int){
        
        let str = Converter.shared.convertDate(date)
        let month: Int = Int(String(str.split(separator: "-")[1])) ?? 1
        let day: Int = Int(String(str.split(separator: "-")[2])) ?? 1
        
        return (month,day)
    }
    
    func setEndDate(date: Date){
        self.budget.endDate = date
    }
    
    func setTerm() {
        let year = Int(Converter.shared.convertDate(self.budget.startDate).split(separator: "-")[0])!
        let month = Int(Converter.shared.convertDate(self.budget.startDate).split(separator: "-")[1])!
        let day = Int(Converter.shared.convertDate(self.budget.startDate).split(separator: "-")[2].split(separator: " ")[0])!
        
        budget.termDay = getLastDay(month: month) //기간일수 설정
        if day == 1{
            //매월 1일로 설정했을 때 (a월 , b일)이라면 -> (a월, 마지막일수)
            let end = "\(year)-\(month)-\(getLastDay(month: month))"
            setEndDate(date: Converter.shared.convertString(end))
        }else{
            //매월 1일로 설정했을 때 (a월 , b일)이라면 -> (a+1월, b-1일)
            var end = ""
            if String(day-1).count == 1{
                end = "\(year)-\(month+1)-0\(day-1)"
            }else{
                end = "\(year)-\(month+1)-\(day-1)"
            }

            
            setEndDate(date: Converter.shared.convertString(end))
            
        }
    }
    
    
    func setStartDate(date: Date){
        
        budget.startDate = Converter.shared.getDateZero(date)
        setTerm()
        
        
        
    }
    
    func setBudget(){
        
        budget.id = budget.autoIncrementKey()
        
        db.writeBudget(data: budget)
        
    }
    
}

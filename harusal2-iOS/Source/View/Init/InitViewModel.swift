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
    
    func setEndDate(date: String){
        self.budget.endDate = date
    }
    
    func setTerm() {
        let year = Int(String(self.budget.startDate.split(separator: "-")[0]))!
        let month = Int(String(self.budget.startDate.split(separator: "-")[1]))!
        let day = Int(String(self.budget.startDate.split(separator: "-")[2]))!
        
        budget.termDay = getLastDay(month: month) //기간일수 설정
        if day == 1{
            //매월 1일로 설정했을 때 (a월 , b일)이라면 -> (a월, 마지막일수)
            let end = "\(year)-\(month)-\(getLastDay(month: month))"
            setEndDate(date: end)
        }else{
            //매월 1일로 설정했을 때 (a월 , b일)이라면 -> (a+1월, b-1일)
            var end = ""
            if String(day-1).count == 1{
                end = "\(year)-\(month+1)-0\(day-1)"
                
            }else{
                end = "\(year)-\(month+1)-\(day-1)"
                
            }
            
            setEndDate(date: end)
        }
    }
    
    
    func setStartDate(date: String){
        print("넘어온거 --> \(date)")
        budget.startDate = date
        setTerm()
        
        
        
    }
    
    func setBudget(){
        
        budget.id = budget.autoIncrementKey()
        print("set예산 --> \(budget)")
        db.writeBudget(data: budget)
        
    }
    
}

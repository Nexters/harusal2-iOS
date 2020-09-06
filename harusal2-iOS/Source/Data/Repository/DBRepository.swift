//
//  BreakDownRepository.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/18.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import RealmSwift

class DBRepository{
   
    static let shared = DBRepository()
    let realm = try! Realm()
    
    func writeData(data: BreakDown){
        try! realm.write{
            realm.add(data, update: .all)
        }
    }
    
    func writeBudget(data: Budget){
        print("write --> \(data)")
        try! realm.write{
            realm.add(data, update: .all)
        }
    }
    
    func readLatestBudget() -> Budget?{
        let data = realm.objects(Budget.self)
        if let bud = data.last{
            return bud
        }else{
            return nil
        }
    }
    
    func readAllBudget() -> [Budget]{
        let data = realm.objects(Budget.self)
        
        return Array(data)
    }
    
    func readAllData() -> [BreakDown]{
        let data = realm.objects(BreakDown.self)
        
        return Array(data)
    }
    
    func readTodayDate() -> [BreakDown]{
        let today = Converter.shared.getDateZero(Date())
        let tomorrow = Converter.shared.getDateNight(Date())
        
        let data = realm.objects(BreakDown.self).filter("date BETWEEN {%@,%@}",today,tomorrow)
        
        return Array(data)
    }
    
    func readMonthData(startDate: Date, endDate: Date) -> [BreakDown]{
        let newStart = Converter.shared.getDateZero(startDate)
        let zeroEnd = Converter.shared.getDateZero(endDate)
        let newEnd = Converter.shared.getDateNight(zeroEnd)
        
        let data = realm.objects(BreakDown.self).filter("date BETWEEN {%@,%@}",newStart,newEnd)
        print("month -->\(data)")
        return Array(data)
    }
    
    func removeAll() {
        try! realm.write{
            realm.deleteAll()
        }
    }
    
    
    
}

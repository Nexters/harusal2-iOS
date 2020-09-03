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
        try! realm.write{
            print("write --> \(data)")
            realm.add(data, update: .all)
        }
    }
    
    func readLatestBudget() -> Budget?{
        var data = realm.objects(Budget.self)
        if let bud = data.last{
            print("All \(data)")
            print("Last \(bud)")
            return bud
        }else{
            print("데이터가 없음")
            return nil
        }
    }
    
    func readAllData() -> [BreakDown]{
        let data = realm.objects(BreakDown.self)
        
        return Array(data)
    }
    
    func readTodayDate() -> [BreakDown]{
        let today = Converter().convertDate(Date())
        
        let data = realm.objects(BreakDown.self).filter("date LIKE %@",today)
        
        return Array(data)
    }
    
    func readMonthData() -> [BreakDown]{
        let today = Converter.shared.convertDate(Date())
        let month: String = String(today.split(separator: "-")[1])
        let data = realm.objects(BreakDown.self).filter("date LIKE '?????\(month)???' ")
        return Array(data)
    }
    
    func removeAll() {
        try! realm.write{
            realm.deleteAll()
        }
    }
    
    
    
}

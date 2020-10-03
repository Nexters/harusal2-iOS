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
    let queue = DispatchQueue.init(label: "Realm")
    
    func writeData(data: BreakDown){
            autoreleasepool{
                try! self.realm.write{
                    self.realm.add(data, update: .all)
                }
            }
            
        
        
    }
    
    func writeBudget(data: Budget){
            autoreleasepool{
                try! self.realm.write{
                    self.realm.add(data, update: .all)
                }
            }
            
        
    }
    
    func readLatestBudget() -> Budget?{
            autoreleasepool{
                let data = self.realm.objects(Budget.self)
                if let bud = data.last{
                    return bud
                }else{
                    return nil
                }
                return nil
            }
            
        
        
        
    }
    
    func readAllBudget() -> [Budget]{
            autoreleasepool{
                let data = realm.objects(Budget.self)
                
                return Array(data)
            }
            
        
        
    }
    
    func readAllData() -> [BreakDown]{
        autoreleasepool{
        let data = realm.objects(BreakDown.self)
        
        return Array(data)
        }
    }
    
    func readTodayDate() -> [BreakDown]{
        
                autoreleasepool{
        let today = Converter.shared.getDateZero(Date())
        let tomorrow = Converter.shared.getDateNight(Date())
        
        let data = realm.objects(BreakDown.self).filter("date BETWEEN {%@,%@}",today,tomorrow)
        
        return Array(data)
                }
    }
    
    func readMonthData(startDate: Date, endDate: Date) -> [BreakDown]{
        autoreleasepool{
        let newStart = Converter.shared.getDateZero(startDate)
        let zeroEnd = Converter.shared.getDateZero(endDate)
        let newEnd = Converter.shared.getDateNight(zeroEnd)
        
        let data = realm.objects(BreakDown.self).filter("date BETWEEN {%@,%@}",newStart,newEnd)
        return Array(data)
        }
    }
    
    func removeAll() {
        queue.async {
            autoreleasepool{
                try! self.realm.write{
                    self.realm.deleteAll()
            }
            }
        }
        
    }
    
    func removeBreakDown(data: BreakDown){
        queue.async {
            autoreleasepool {
                try! self.realm.write{
                    self.realm.delete(data)
                }
            }
        }
       
    }
    
    
    
}

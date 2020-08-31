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
    
    
    
    func readAllData() -> [BreakDown]{
        let data = realm.objects(BreakDown.self).compactMap{ $0 }
        return Array(data)
    }
    
    func readTodayDate() -> [BreakDown]{
        let today = Converter().convertDate(Date())
        
        let data = realm.objects(BreakDown.self).filter("date LIKE %@",today)
        print(data)
        return Array(data)
    }
    
    func removeAll() {
        try! realm.write{
            realm.deleteAll()
        }
    }
    
}

//
//  Budget.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/01.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Budget : Object {
    dynamic var id: Int = 0
    dynamic var money: Int = 0
    dynamic var termDay: Int = 0
    dynamic var startDate: Date = Date()
    dynamic var endDate: Date = Date()

    override class func primaryKey() -> String? {
        return "id"
    }
    
    func autoIncrementKey() -> Int{
        let realm = try! Realm()
        
        return (realm.objects(Budget.self).max(ofProperty: "id")
            as Int? ?? 0) + 1
    }
    
    func updateMoney(money: Int){
        try! realm?.write{
            self.money = money
        }
    }
    
    func updateEndDate(endDate: Date){
        try! realm?.write{
            self.endDate = endDate
        }
    }
    
    
    
}

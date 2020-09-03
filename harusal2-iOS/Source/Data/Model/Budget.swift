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
    dynamic var startDate: String = ""
    dynamic var endDate: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }
    
    func autoIncrementKey() -> Int{
        let realm = try! Realm()
        return (realm.objects(Budget.self).max(ofProperty: "id")
            as Int? ?? 0) + 1
    }
    
    func update(money: Int, termDay: Int, startDate: String, endDate: String){
        try! realm?.write{
            self.money = money
            self.termDay = termDay
            self.startDate = startDate
            self.endDate = endDate
        }
    }
    
    
    
}

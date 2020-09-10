//
//  BreakDown.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/08.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class BreakDown : Object {
    dynamic var id: Int = 0
    dynamic var date: Date = Date()
    dynamic var amount: Int = 0
    dynamic var content: String = ""
    dynamic var type: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func autoIncrementKey() -> Int{
        let realm = try! Realm()
        return (realm.objects(BreakDown.self).max(ofProperty: "id")
            as Int? ?? 0) + 1
    }
    
    func update(date: Date, amount: Int, content: String, type: Int){
        try! realm?.write{
            self.date=date
            self.amount=amount
            self.content=content
            self.type=type
        }
    }
    
    func remove(){
        try! realm?.write{
            realm?.delete(self)
        }
    }
    
    
    
}

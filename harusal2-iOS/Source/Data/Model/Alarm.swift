//
//  Alarm.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/01.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Alarm : Object {
    dynamic var id: Int = 0
    dynamic var onOff: Bool = false

    override class func primaryKey() -> String? {
        return "id"
    }
    
    func autoIncrementKey() -> Int{
        let realm = try! Realm()
        return (realm.objects(BreakDown.self).max(ofProperty: "id")
            as Int? ?? 0) + 1
    }
    
    func update(onOff: Bool){
        try! realm?.write{
            self.onOff = onOff
        }
    }
    
    
    
}

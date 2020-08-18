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
    dynamic var date: String = ""
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
    
}

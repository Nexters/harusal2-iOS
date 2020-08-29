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
        let aa = realm.objects(BreakDown.self).compactMap{ $0 }
        print(aa)
        return Array(aa)
    }
    
}

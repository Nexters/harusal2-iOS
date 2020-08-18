//
//  BreakDownRepository.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/18.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class DBRepository{
   
    static let shared = DBRepository()
    let realm = try! Realm()

            

            // Realm파일이 생성되는 위치 출력

    
//    func addData(){
//        let data :BreakDown = BreakDown()
//           data.id = data.autoIncrementKey()
//           data.amount = 100
//           data.date = formatter.convertDate(Date())
//           data.content = "zzz"
//           data.type = 1
//           let data2 :BreakDown = BreakDown()
//           data2.id = data2.autoIncrementKey()
//           data2.amount = 100
//           data2.date = formatter.convertDate(Date())
//           data2.content = "zzz"
//           data2.type = 2
//           
//           let realm = try! Realm()
//           
//        Observable.from([data,data2])
//            .subscribe(realm.rx.add())
//        
//           try! realm.write {
//               realm.add(data, update: .all)
//               realm.add(data2, update: .all)
//           }
//    }
    
    
    func readAllData() -> [BreakDown]{
        let aa = realm.objects(BreakDown.self).compactMap{ $0 }
        print(aa)
        return Array(aa)
    }
    
}

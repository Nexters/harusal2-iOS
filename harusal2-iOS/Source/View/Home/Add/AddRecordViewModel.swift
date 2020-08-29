//
//  AddRecordViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class AddRecordViewModel{
    
    var type = 0
    var money: String = ""
    var content: String = ""
    let repository = DBRepository()
    var date: Date?{
        didSet{
            dateChanged?(date)
        }
    }
    
    
    
    var breakDown : BreakDown?
    
    func addData(){
        
        let str = money.filter {
            return Int(String($0)) != nil
        }
        let moneyInt = Int(str)
        
        let data = BreakDown()
        data.id = data.autoIncrementKey()
        data.amount = moneyInt ?? 0
        data.type = type
        data.content = content
        data.date = date ?? Date()
        
        repository.writeData(data: data)
        
        
    }
    
    var dateChanged : ((Date?) -> ())?
    
    
}

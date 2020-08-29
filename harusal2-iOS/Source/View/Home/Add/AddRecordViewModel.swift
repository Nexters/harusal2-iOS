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
    let repository = DBRepository()
    var date: String?{
        didSet{
            dateChanged?(date)
        }
    }
    
    
    var breakDown : BreakDown?
    
    func updateData(date: String?, content: String?, type: Int){
        
        let data = BreakDown()
        
        let moneyInt = money.filter {
            return Int(String($0)) != nil
        }
        
        repository.writeData(data: <#T##BreakDown#>)
        
        data.update(date: date!, amount: moneyInt ?? 0, content: content ?? "", type: type)
        
    }
    
    var dateChanged : ((String?) -> ())?
    
    
}

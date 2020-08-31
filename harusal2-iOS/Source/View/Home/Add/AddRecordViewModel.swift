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
    var date: String?
    
    
    
    var breakDown : BreakDown?
    
    func convertMoney(str: String) -> Int{
        return Int(str) ?? 0
        
    }
    
    func addData(){
        let data = BreakDown()
        data.id = data.autoIncrementKey()
        data.amount = convertMoney(str: money)
        data.type = type
        data.content = content
        data.date = date ?? Converter.shared.convertDate(Date())
        
        repository.writeData(data: data)
        
        
    }
    
    var dateChanged : ((String?) -> ())?
    
    
}

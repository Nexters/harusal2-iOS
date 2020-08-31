//
//  ListEditViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class ListEditViewModel{
    
    var money: String = ""
    var content: String = ""
    var type: Int = 0
    
    var date: String?{
        didSet{
            dateChanged?(date)
        }
    }
    func convertMoney(str: String) -> Int{
        let newStr = str.filter {
            return Int(String($0)) != nil
        }
        
        return Int(newStr) ?? 0
        
    }
    
    var breakDown : BreakDown?
    
    func updateData(){
        guard let data = breakDown else{
            return
        }
        
        data.update(date: date ?? Converter.shared.convertDate(Date()), amount: convertMoney(str: money), content: content, type: type)
    }
    
    var dateChanged : ((String?) -> ())?
    
    
}

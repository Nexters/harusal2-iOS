//
//  ListEditViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class ListEditViewModel{
    
    var date: String?{
        didSet{
            dateChanged?(date)
        }
    }
    
    
    
    var breakDown : BreakDown?
    
    func updateData(){
        
        guard let data = breakDown, let date = self.date else{
            return
        }
        data.update(date: date, amount: data.amount+100, content: data.content, type: data.type)
        
    }
    
    var dateChanged : ((String?) -> ())?
    
    
}

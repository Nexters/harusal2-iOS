//
//  ListEditViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class ListEditViewModel{
    
    var date: Date?{
        didSet{
            dateChanged?(date)
        }
    }
    
    
    var breakDown : BreakDown?
    
    func updateData(date: Date?, amount: Int?, content: String?, type: Int){
        
        guard let data = breakDown else{
            return
        }
        let numberFormatter = NumberFormatter()
        
        data.update(date: date!, amount: amount ?? 0, content: content ?? "", type: type)
        
    }
    
    var dateChanged : ((Date?) -> ())?
    
    
}

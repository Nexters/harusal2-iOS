//
//  ListEditViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class ListDetailViewModel{
    
    var breakDown: BreakDown?
    let db = DBRepository.shared
    
    func deleteBreakDown(){
        guard let data = self.breakDown else{
            return
        }
        db.removeBreakDown(data: data)
    }
    
    
}

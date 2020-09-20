//
//  EditMoneyViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class EditMoneyViewModel{
    
    var money: Int = 0
    var budget: Budget = Budget()
    let db = DBRepository.shared
    
    func getMonthBudget(){
        budget = db.readLatestBudget() ?? Budget()
    }
    
    
    
    func editMoney(){
        print(money)
        budget.updateMoney(money: money)
    }
    
}

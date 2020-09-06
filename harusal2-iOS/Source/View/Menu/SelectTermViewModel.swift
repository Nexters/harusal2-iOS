//
//  SelectTermViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/06.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class SelectTermViewModel{
    
    var budget: [Budget] = []
    let db = DBRepository.shared // 싱글톤
    var nowBudget = Budget()
    
    func readAllBudget(refresh : () -> ()){
        budget = db.readAllBudget()
        refresh()
    }
    
}

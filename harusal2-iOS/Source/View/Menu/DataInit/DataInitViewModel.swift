//
//  DataInitViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class DataInitViewModel{
    
    let db = DBRepository.shared
    let sp = SharedPreference.shared
    
    func removeData(){
        db.removeAll()
        sp.removeData()
    }
    
}

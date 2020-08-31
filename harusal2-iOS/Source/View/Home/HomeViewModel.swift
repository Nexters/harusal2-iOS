//
//  HomeViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class HomeViewModel{
    
    var breakDownList : [BreakDown] = []// BehaviorSubject로 한 이유 : VC에서 ViewModel을 먼저 생성하기 때문에,

    let db = DBRepository.shared // 싱글톤
    
    
    func getAllData(refresh: @escaping () -> ()){
        breakDownList = db.readTodayDate()
    
        DispatchQueue.main.async {
            refresh()
        }
    }
    
}

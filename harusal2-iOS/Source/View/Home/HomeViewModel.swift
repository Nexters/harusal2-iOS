//
//  HomeViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

class HomeViewModel : ViewModelType{
    
    let useList = BehaviorRelay<[BreakDown]>(value: [])// BehaviorSubject로 한 이유 : VC에서 ViewModel을 먼저 생성하기 때문에,

    let db = DBRepository.shared // 싱글톤
    
    
    
    
    struct Inputs {
        
    }
    
    struct Outputs {
        
    }
    
    init() {
        getAllData()
    }
    
    
    
    func getAllData(){
        let arr = db.readAllData()
        useList.accept( useList.value + arr )
        
    }
    
}

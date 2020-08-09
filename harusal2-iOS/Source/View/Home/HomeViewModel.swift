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

    
    
    struct Inputs {
        
    }
    
    struct Outputs {
        
    }
    
    init() {
        setDummyData()
    }
    
    
    func setDummyData(){
        var arr : [BreakDown] = []
        arr.append(BreakDown(isIncome: true,price: 1000, content: "돈 주움"))
        arr.append(BreakDown(isIncome: false,price: 4000, content: "떡볶이 사머금"))
        arr.append(BreakDown(isIncome: true,price: 100000, content: "용돈 받았어"))
        arr.append(BreakDown(isIncome: true,price: 1000, content: "돈 주움"))
        arr.append(BreakDown(isIncome: false,price: 4000, content: "떡볶이 사머금"))
        arr.append(BreakDown(isIncome: true,price: 100000, content: "용돈 받았어"))
        arr.append(BreakDown(isIncome: true,price: 1000, content: "돈 주움"))
        arr.append(BreakDown(isIncome: false,price: 4000, content: "떡볶이 사머금"))
        arr.append(BreakDown(isIncome: true,price: 100000, content: "용돈 받았어"))
        arr.append(BreakDown(isIncome: true,price: 1000, content: "돈 주움"))
        arr.append(BreakDown(isIncome: false,price: 4000, content: "떡볶이 사머금"))
        arr.append(BreakDown(isIncome: true,price: 100000, content: "용돈 받았어"))
        useList.accept(useList.value + arr)
    }
    
}

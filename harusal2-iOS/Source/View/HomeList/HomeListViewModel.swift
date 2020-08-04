//
//  HomeListViewModel.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import RxSwift

class HomeListViewModel: ViewModelType {
    
    var dayList = BehaviorSubject<[Money]>(value: [])   // BehaviorSubject로 한 이유 : VC에서 ViewModel을 먼저 생성하기 때문에,
                                                        //    init() 함수가 DataBinding 하기 전에 미리 호출됨
    
    struct Inputs {
        
    }
    
    struct Outputs {
        
    }
    
    init() {
        //화면 켜질 때 데이터 불러오기
        dayList.onNext(setDummyData())
        
        //나중에 페이징 구현하기
    }
    
    //Model에서 데이터 불러와 Observable<List>에 담기
    //
    func setDummyData() -> [Money]{
        var arr : [Money] = []
        arr.append(Money(day: 1, income: 1, expense: 1))
        arr.append(Money(day: 2, income: 2, expense: 2))
        arr.append(Money(day: 3, income: 3, expense: 3))
        print("\(arr)")
        return arr
    }
    
}

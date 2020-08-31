//
//  EditDayViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class EditDayViewController: BasePickerView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func getMonthAndDay()-> (Int,Int){
        // TODO: DB에서 생활비 사용 기간 가져오기
        return (8,30)
    }
}

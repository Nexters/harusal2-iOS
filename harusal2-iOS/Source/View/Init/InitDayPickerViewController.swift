//
//  InitDayPickerViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitDayPickerViewController: BasePickerView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func getMonthAndDay()-> (Int,Int){
        // TODO: DB에서 오늘 날짜 가져오기
        return (9,10)
    }
}

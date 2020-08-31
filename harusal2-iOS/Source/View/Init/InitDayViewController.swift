//
//  InitDayViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitDayViewController: UIViewController {
    
    @IBOutlet var dayLabel: [UILabel]?
    
    lazy var day: String = returnDay()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTodayLabel()
    }
    
    func returnDay() -> String {
        return String(17)  // TODO : 일 가져오기
    }
    
    func setTodayLabel(){
        dayLabel?[0].text = day
        dayLabel?[1].text = day
    }
}

//
//  EditDayViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class EditDayViewController: UIViewController {
    
    @IBOutlet weak var monthlyBudgetDurationLabel: UILabel!
    lazy var duration = getMonthlyBudgetDuration()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitView()
    }
    
    func getMonthlyBudgetDuration()-> (Int,Int){
        // TODO: DB에서 날짜 데이터 가져오기
        return (9,17-1)
    }
    
    func setInitView(){
        monthlyBudgetDurationLabel.text = "\(duration.0).\(duration.1+1)~\(duration.0+1).\(duration.1)"
    }
}

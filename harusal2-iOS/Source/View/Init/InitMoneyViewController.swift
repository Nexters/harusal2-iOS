//
//  InitMoneyViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitMoneyViewController: UIViewController {
    
    @IBOutlet weak var monthBudgetText : UITextField!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var butgetPerDayLabel: UILabel!
    
    @IBAction func showText(_ sender:UITextField){
        let text = self.monthBudgetText.text ?? "0"
        let calc = Int(text) ?? 1
        self.budgetLabel.text = "\(text)원"
        self.butgetPerDayLabel.text = "\(String(calc/30))원"
    }
    
    @IBAction func tapViewHideKeyBoard(_ sender:UIGestureRecognizer){
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

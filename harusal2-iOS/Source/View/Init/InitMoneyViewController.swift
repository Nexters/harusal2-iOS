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
    @IBOutlet weak var budgetPerDayLabel: UILabel!
    
    @IBAction func showText(_ sender:UITextField){
        let text = self.monthBudgetText.text ?? "0"
        let calc = Int(text) ?? 1
        self.budgetLabel.text = "\(text)원"
        self.budgetPerDayLabel.text = "\(String(calc/30))원"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        monthBudgetText.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.monthBudgetText.becomeFirstResponder()
    }
}

extension InitMoneyViewController: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ sender: UITextField) -> Bool {
        setupTextFieldsAccessoryView()
        return true
    }

    func setupTextFieldsAccessoryView() {
        guard monthBudgetText.inputAccessoryView == nil else {
            return
        }

        let toolBar: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height:70))
//        toolBar.barStyle = UIBarStyle.black
        toolBar.barTintColor = UIColor.init(named: "ColorButton")
        toolBar.isTranslucent = false
        
        let flexsibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        let nextButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressNextButton))
    
        toolBar.items = [flexsibleSpace, nextButton]
    
        monthBudgetText.inputAccessoryView = toolBar
    }

    @objc func didPressNextButton(button: UIButton) {
        let storyBoard = UIStoryboard(name: "Sub", bundle:nil)
        let memberDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "InitDayViewControllerId")
        self.navigationController?.pushViewController(memberDetailsViewController, animated:true)
    }
}

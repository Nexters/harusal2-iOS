//
//  InitDayPickerViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitDayPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var monthlyBudgetDurationLabel: UILabel!
    
    private var values: [String] = []
    lazy var today = returnTodayMonthDate()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        picker.frame = CGRect(x: 140, y: 100, width: 100.0, height: 480.0)
        
        picker.delegate = self
        picker.delegate = self

        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.pickerView)
        
        initView()
    }
    
    func returnTodayMonthDate() -> (Int,Int) {
        return (9,17-1)  // TODO : 월,일 받아오기
    }
    
    func initView(){
        monthlyBudgetDurationLabel.text = "\(today.0).\(today.1+1)~\(today.0+1).\(today.1)"
        
        setPickerValues(todayMonth: today.0)
        setPickerDefaultValue(todayDate: today.1)
    }

    func setPickerValues(todayMonth: Int){
        var lastDate = 0
        
        switch todayMonth {
        case 2 : lastDate = 29
        case 4, 6, 9, 11 : lastDate = 30
        default : lastDate = 31
        }
        
        for i in 1...lastDate {
            values.append(String(i))
        }
    }
    
    func setPickerDefaultValue(todayDate: Int) {
        self.pickerView.selectRow(todayDate, inComponent: 0, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont.systemFont(ofSize: 38, weight: UIFont.Weight.light)
            pickerLabel?.textAlignment = .center
        }
        
        pickerLabel?.text = values[row]
        pickerLabel?.textColor = UIColor(named: "ColorTextMain")

        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        monthlyBudgetDurationLabel.text = "\(today.0).\(row+1)~\(today.0+1).\(row)"
     }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60.0
    }
}

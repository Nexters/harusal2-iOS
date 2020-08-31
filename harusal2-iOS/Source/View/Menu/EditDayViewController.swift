//
//  EditDayViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class EditDayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var monthlyBudgetDurationLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    lazy var duration = getMonthlyBudgetDuration()
    private var values: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setInitView()
    }
    
    func getMonthlyBudgetDuration()-> (Int,Int){
        // TODO: DB에서 날짜 데이터 가져오기
        return (9,17-1)
    }
    
    func setInitView(){
        monthlyBudgetDurationLabel.text = "\(duration.0).\(duration.1+1)~\(duration.0+1).\(duration.1)"
        
        setPickerValues(todayMonth: duration.0)
        setPickerDefaultValue(todayDate: duration.1)
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
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return 100.0
        }
        
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 60.0
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
}

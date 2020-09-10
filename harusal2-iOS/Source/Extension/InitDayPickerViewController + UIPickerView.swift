//
//  BasePickerView.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

extension InitDayPickerViewController : UIPickerViewDelegate, UIPickerViewDataSource, InitDay {
    
    
    func setInitView(){
        monthlyBudgetDurationLabel.text = "\(viewModel.monthAndDay.0).\(viewModel.monthAndDay.1+1)~\(viewModel.monthAndDay.0+1).\(viewModel.monthAndDay.1)"
        
        setPickerValues(todayMonth: viewModel.monthAndDay.0, day: viewModel.monthAndDay.1)
        setPickerDefaultValue()
    }
    
    func getLastDay(month: Int) -> Int{
        var lastDate = 0
        switch month {
        case 2 :
            lastDate = 29
        case 4, 6, 9, 11 :
            lastDate = 30
        default :
            lastDate = 31
        }
        
        return lastDate
    }
    
    func setPickerValues(todayMonth: Int, day: Int){
        var lastDate = 0
        
        switch todayMonth {
        case 2 :
            lastDate = 29
        case 4, 6, 9, 11 :
            lastDate = 30
        default :
            lastDate = 31
        }
        
        for i in day...lastDate {
            self.viewModel.values.append(i)
        }
    }
   
    
    
    func setPickerDefaultValue() {
        self.pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let today = Converter.shared.convertDate(Date())
        var str = ""
        if self.viewModel.values[row] == 1{
            //매월 1일로 설정했을 때 (a월 , b일)이라면 -> (a월, 마지막일수)
            str = "\(viewModel.monthAndDay.0).\(self.viewModel.values[row])~\(viewModel.monthAndDay.0).\(getLastDay(month: viewModel.monthAndDay.0))"
        let date = "\(today.split(separator: "-")[0])-\(today.split(separator: "-")[1])-\(self.viewModel.values[row])"
            self.viewModel.setStartDate(date: Converter.shared.convertString(date))
        }else{
            //매월 1일로 설정했을 때 (a월 , b일)이라면 -> (a+1월, b-1일)
            str = "\(viewModel.monthAndDay.0).\(self.viewModel.values[row])~\(viewModel.monthAndDay.0+1).\(self.viewModel.values[row]-1)"
            let date = "\(today.split(separator: "-")[0])-\(today.split(separator: "-")[1])-\(self.viewModel.values[row])"
            self.viewModel.setStartDate(date: Converter.shared.convertString(date))
        }
       
        monthlyBudgetDurationLabel.text = str
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.viewModel.values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(self.viewModel.values[row])
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
        
        pickerLabel?.text = String(viewModel.values[row])
        pickerLabel?.textColor = UIColor(named: "ColorTextMain")

        return pickerLabel!
    }
}

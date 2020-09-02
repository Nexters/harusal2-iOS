//
//  BasePickerView.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

extension InitDayPickerViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func setInitView(){
        monthlyBudgetDurationLabel.text = "\(monthAndDay.0).\(monthAndDay.1+1)~\(monthAndDay.0+1).\(monthAndDay.1)"
        
        setPickerValues(todayMonth: monthAndDay.0, day: monthAndDay.1)
        setPickerDefaultValue()
    }
    
    func checkLastDay(month: Int, day: Int) -> Bool{
        switch month {
        case 2 :
            if day == 29{
                return true
            }
        case 4, 6, 9, 11 :
            if day == 30{
                return true
            }
        default :
            if day == 31{
                return true
            }
        }
        return false
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
            values.append(i)
        }
    }
   
    func getMonthAndDay(date: Date)-> (Int,Int){
        
        let str = Converter.shared.convertDate(date)
        let month: Int = Int(String(str.split(separator: "-")[1])) ?? 1
        let day: Int = Int(String(str.split(separator: "-")[2])) ?? 1
        
        return (month,day)
    }
    
    func setPickerDefaultValue() {
        self.pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var str = ""
        if self.values[row] == 1{
            //매월 1일로 설정했을 때 (a월 , b일)이라면 -> (a월, 마지막일수)
            str = "\(monthAndDay.0).\(self.values[row])~\(monthAndDay.0).\(getLastDay(month: monthAndDay.0))"
        }else{
            //매월 1일로 설정했을 때 (a월 , b일)이라면 -> (a+1월, b-1일)
            str = "\(monthAndDay.0).\(self.values[row])~\(monthAndDay.0+1).\(self.values[row]-1)"
        }
       
        monthlyBudgetDurationLabel.text = str
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(self.values[row])
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
        
        pickerLabel?.text = String(values[row])
        pickerLabel?.textColor = UIColor(named: "ColorTextMain")

        return pickerLabel!
    }
}

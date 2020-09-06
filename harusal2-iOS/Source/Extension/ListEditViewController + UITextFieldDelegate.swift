//
//  ListEditViewController + UITextFieldDelegate.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/28.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

extension ListEditViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //replacementString : 방금 입력된 문자 하나 or 붙여넣기 된 문자열
        // return -> 텍스트가 바뀌어야하면 true, 아니면 false
        //이 메소드 내에서 textField.text는 현재 입력된 string이 붙기 전의 string
        if(textField == self.moneyTextField){
        
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.locale = Locale.current
            formatter.maximumFractionDigits = 0
            
            if let removeAllSeprator = textField.text?.replacingOccurrences(of: formatter.groupingSeparator, with: ""){
                var beforeFormattedString = removeAllSeprator + string
                if formatter.number(from: string) != nil{
                    if let formattedNumber = formatter.number(from: beforeFormattedString), let formattedString = formatter.string(from: formattedNumber){
                        textField.text = formattedString
                        amount = Int(formattedNumber)
                        return false
                    }
                }else{ // 숫자가 아닐 때
                    if string == "" { //백스페이스일 때
                        let lastIndex = beforeFormattedString.index(beforeFormattedString.endIndex, offsetBy: -1)
                        beforeFormattedString = String(beforeFormattedString[..<lastIndex])
                        if let formattedNumber = formatter.number(from: beforeFormattedString), let formattedString = formatter.string(from: formattedNumber){
                            textField.text = formattedString
                            amount = Int(formattedNumber)
                            return false
                        }
                    }else{ //문자일 때
                        return false
                    }
                }
            }
        }
        return true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.borderWidth = 1
        textField.roundView(by: 100)
//        textField.layoutIfNeeded()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.roundView(by: 100)
//        textField.layoutIfNeeded()
    }
}


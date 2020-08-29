//
//  AddViewController+UITextFieldDelegate.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/28.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

extension AddMoneyViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //replacementString : 방금 입력된 문자 하나 or 붙여넣기 된 문자열
        // return -> 텍스트가 바뀌어야하면 true, 아니면 false
        //이 메소드 내에서 textField.text는 현재 입력된 string이 붙기 전의 string
        if let isEmpty = textField.text?.isEmpty{
            if !isEmpty{
                //textField 가 비어있지 않을 때
                textField.text?.removeLast() // "원" 삭제
            }
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        
        if let removeAllSeprator = textField.text?.replacingOccurrences(of: formatter.groupingSeparator, with: ""){
            var beforeFormattedString = removeAllSeprator + string
            if formatter.number(from: string) != nil{
                if let formattedNumber = formatter.number(from: beforeFormattedString), let formattedString = formatter.string(from: formattedNumber){
                    textField.text = formattedString + "원"
                    
                    //한글 Label 설정 클로저
                    
                    return false
                }
            }else{ // 숫자가 아닐 때
                if string == "" { //백스페이스일 때
                    let lastIndex = beforeFormattedString.index(beforeFormattedString.endIndex, offsetBy: -1)
                    beforeFormattedString = String(beforeFormattedString[..<lastIndex])
                    if let formattedNumber = formatter.number(from: beforeFormattedString), let formattedString = formatter.string(from: formattedNumber){
                        textField.text = formattedString + "원"

                        //한글 Label 설정 클로저
                        
                        return false
                    }
                }else{ //문자일 때
                    return false
                }
            }
        }
        return true
        
    }
    
}

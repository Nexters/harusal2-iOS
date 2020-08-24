//
//  UITextField+.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/15.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{

    
    @objc func done(){
            self.resignFirstResponder()
    }
    
    func addDoneButtonOnDesKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let zzero: UIBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(self.done))
        let items = [flexSpace, zzero]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    
    
   
    
    
    
}

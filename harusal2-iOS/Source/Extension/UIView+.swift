//
//  UIView+.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    func roundView(by n: Float){
        self.layer.cornerRadius = self.frame.width/CGFloat(n)
    }
    
    func setBorder(thick: CGFloat, color: CGColor){
        self.layer.borderWidth = thick
        self.layer.borderColor = color
    }
    
   
    
}

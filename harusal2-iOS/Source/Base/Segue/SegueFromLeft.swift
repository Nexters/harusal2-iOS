//
//  SegueFromLeft.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/13.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

class SegueFromLeft: UIStoryboardSegue{
    
    override func perform() {
        let src = self.source
        let des = self.destination
        print(des)
        if let superView = src.view.superview {
            superView.insertSubview(des.view, aboveSubview: src.view)
            des.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)

            
        }else {
            return
        }
        
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
            des.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: { finish in
            src.present(des,animated: false,completion: nil)
        })
    }
    
}



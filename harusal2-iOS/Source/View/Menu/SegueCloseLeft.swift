//
//  SegueCloseMenu.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/13.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

class SegueCloseLeft: UIStoryboardSegue{
    
    override func perform() {
        let src = self.source
        let des = self.destination
        
        if let superView = src.view.superview{
            superView.insertSubview(des.view, belowSubview: src.view)
            src.view.transform = CGAffineTransform(translationX: 0, y: 0)
        } else{
            return
        }
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            src.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)
        }, completion: { finished in
            src.dismiss(animated: false, completion: nil)
        })
        
    }
    
}

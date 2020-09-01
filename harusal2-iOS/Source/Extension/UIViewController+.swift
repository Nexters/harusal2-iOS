//
//  UIViewController+.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/01.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
     func slideLeft(from snapshot: UIView, to vc: UIViewController){
        vc.view.addSubview(snapshot)
        self.view.window?.rootViewController = vc

            UIView.animate(withDuration: 0.5, animations: {
                snapshot.transform = CGAffineTransform(translationX: 500, y: 0)
                vc.view.transform = CGAffineTransform(translationX: 0, y: 0)
//            3D 애니메이션
//            snapshot.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
            }, completion: { finish in
                snapshot.removeFromSuperview()
            })
    }
    
    func popLeft(from snapshot: UIView, to vc: UIViewController){
        vc.view.addSubview(snapshot)
        self.view.window?.rootViewController = vc

        UIView.animate(withDuration: 0.5, animations: {
            snapshot.transform = CGAffineTransform(translationX: -500, y: 0)
            vc.view.transform = CGAffineTransform(translationX: 0, y: 0)
//          3D 애니메이션
//          snapshot.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
        }, completion: { finish in
                        snapshot.removeFromSuperview()
        })
        
    }
}

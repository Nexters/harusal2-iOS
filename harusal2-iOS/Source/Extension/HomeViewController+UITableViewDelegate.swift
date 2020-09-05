//
//  ViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y: CGFloat = scrollView.contentOffset.y
        let newHeaderViewHeight: CGFloat = headerViewHeightConstraint.constant - y
        let newHeaderViewTop : CGFloat = headerViewTop.constant - y * 170/140
        // * (자신이 올라갈)
        let newTodayMoneyLabelCenterX: CGFloat = todayMoneyLabelCenterX.constant - y * 100/140
        let newCenterX : CGFloat = centerX.constant + y * 100/140
        let newMoneyTop : CGFloat = moneyTop.constant + y * 50/140
        print("headerTop - >\(newHeaderViewTop)")
        
        if newHeaderViewHeight > headerViewMaxHeight{//280
            headerViewHeightConstraint.constant = headerViewMaxHeight
//            animationViewHeightConstraint.constant = animationViewMaxHeight
            headerViewTop.constant = headerViewTopMax
            todayMoneyLabelCenterX.constant = todayMoneyLabelMaxX
            centerX.constant = minX
            moneyTop.constant = 12
            animationView.layoutIfNeeded()
        } else if newHeaderViewHeight < headerViewMinHeight{//140
            headerViewHeightConstraint.constant = headerViewMinHeight
//            animationViewHeightConstraint.constant = animationViewMinHeight
            headerViewTop.constant = -170+(self.navigationController?.navigationBar.frame.height)! // 170 -> height : 130, Top : 40, NavigationBar Height
            todayMoneyLabelCenterX.constant = todayMoneyLabelMinX
            moneyTop.constant = 62
            centerX.constant = maxX
            animationView.layoutIfNeeded()
        }else{
            headerViewHeightConstraint.constant = newHeaderViewHeight
//            animationViewHeightConstraint.constant = newAnimationViewHeight
            animationView.alpha = (newHeaderViewHeight-140)/140
            print(animationView.alpha)
            headerViewTop.constant = newHeaderViewTop
            moneyTop.constant = newMoneyTop
            centerX.constant = newCenterX
            todayMoneyLabelCenterX.constant = newTodayMoneyLabelCenterX
            scrollView.contentOffset.y = 0 // block Scroll View
        }
        
        
        
    }
}

//class ResizeImageView : UIImageView{
//
//    override var intrinsicContentSize: CGSize{
//        if let myImage = self.image {
//            let myImageWidth = myImage.size.width
//            let myImageHeight = myImage.size.height
//            let myViewWidth = self.frame.size.width
//
//            let ratio = myViewWidth/myImageWidth
//            let scaledHeight = myImageHeight * ratio
//
//            return CGSize(width: myViewWidth, height: scaledHeight)
//        }
//
//        return CGSize(width: -1.0, height: -1.0)
//    }
//
//}

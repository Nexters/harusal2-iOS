//
//  ViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y: CGFloat = scrollView.contentOffset.y
        let newHeaderViewHeight: CGFloat = headerViewHeightConstraint.constant - y
        let newImageViewHeight: CGFloat = imageViewHeightConstraint.constant - y
        let newTodayMoneyLabelCenterX: CGFloat = todayMoneyLabelCenterX.constant - y*4/7
        
        print(y)
        
        if newHeaderViewHeight > headerViewMaxHeight{
            headerViewHeightConstraint.constant = headerViewMaxHeight
            imageViewHeightConstraint.constant = imageViewMaxHeight
            todayMoneyLabelCenterX.constant = todayMoneyLabelMaxX
        } else if newHeaderViewHeight < headerViewMinHeight{
            headerViewHeightConstraint.constant = headerViewMinHeight
            imageViewHeightConstraint.constant = imageViewMinHeight
            todayMoneyLabelCenterX.constant = todayMoneyLabelMinX
        }else{
            headerViewHeightConstraint.constant = newHeaderViewHeight
            imageViewHeightConstraint.constant = newImageViewHeight
            todayMoneyLabelCenterX.constant = newTodayMoneyLabelCenterX
            scrollView.contentOffset.y = 0 // block Scroll View
        }
        
    }
    
    
    
}

//
//  UITableView+.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/06.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    func setHomeEmptyView(width: CGFloat, height: CGFloat, color: UIColor) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: width, height: 60))
        
        let str = "기록을 추가해주세요!"
        let view = UILabel()
        view.text = str
        view.backgroundColor = color
        view.textColor = .white
        view.textAlignment = .center
        
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = 2
        dashBorder.strokeColor = UIColor.white.cgColor
        dashBorder.lineDashPattern = [4,4]
        dashBorder.frame = emptyView.bounds
        dashBorder.fillColor = nil
        dashBorder.path = UIBezierPath(roundedRect: emptyView.bounds, cornerRadius: 10).cgPath
        view.layer.addSublayer(dashBorder)

        emptyView.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.leadingAnchor.constraint(equalTo: emptyView.leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: emptyView.trailingAnchor, constant: 0).isActive = true

      self.backgroundView = emptyView
      self.separatorStyle = .none
    }
}

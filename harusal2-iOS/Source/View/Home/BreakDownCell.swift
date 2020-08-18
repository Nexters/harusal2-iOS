//
//  TodayCell.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/08.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit


class BreakDownCell: UITableViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var showDetailButton: UIButton!
    
    func update(_ breakDown: BreakDown){
        self.priceLabel.text = String(breakDown.amount)
        if breakDown.type == 0 {
            self.priceLabel.textColor = .blue
        }
        else{
            self.priceLabel.textColor = .red
        }
        self.contentLabel.text = String(breakDown.content)
    }
    
    
}

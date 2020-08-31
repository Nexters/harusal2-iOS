//
//  SecondHeaderView.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

class SecondHeaderView: UICollectionReusableView {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var outMoney: UILabel!
    @IBOutlet weak var inMoney: UILabel!
    var data: (Int,Int,Int) = (0,0,0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func updateUI(data: (Int,Int,Int)){
        
        self.dayLabel.text = String(data.0)
        self.outMoney.text = String(data.1)
        self.inMoney.text = String(data.2)
    }
    
}



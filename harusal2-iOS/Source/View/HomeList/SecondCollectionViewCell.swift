//
//  SecondCollectionViewCell.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit
class SecondCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var contentLabel : UILabel!
    @IBOutlet weak var showDetailButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(_ breakDown: BreakDown){
        
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

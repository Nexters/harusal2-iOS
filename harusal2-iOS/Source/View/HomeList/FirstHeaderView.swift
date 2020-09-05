//
//  FirstHeaderView.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

class FirstHeaderView: UICollectionReusableView{
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var duringLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(money: String){
        moneyLabel.text = money
    }
    
}

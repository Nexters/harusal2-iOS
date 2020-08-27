//
//  SecondFooterView.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

class SecondFooterView: UICollectionReusableView {
    @IBOutlet weak var expandButton: UIButton!
    
    var expandHandler : (() -> Void)?
    
    var count=0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func touchUpExpandButton(_ sender: Any) {
        
        expandHandler?()
        
    }
    
    
}

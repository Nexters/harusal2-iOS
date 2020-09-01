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
    var contractHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func touchUpExpandButton(_ sender: Any) {
        
        if expandHandler != nil{
            //Handler가 초기화되어있지 않으면 Event 막음
            if expandButton.titleLabel?.text == "Expand"{
                expandButton.setTitle("Contract", for: .normal)
                expandHandler?()
            }else{
                expandButton.setTitle("Expand", for: .normal)
                contractHandler?()
            }
        }
    }
    
    
}

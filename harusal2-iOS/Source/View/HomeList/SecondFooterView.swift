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
    var flag = false
    var expandHandler : (() -> Void)?
    var contractHandler: (() -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("111 -> \(flag)")
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func updateUI(){
        if flag{
            expandButton.setImage(UIImage(named: "btn_dropup_24"), for: .normal)
            
        }
        else{

            expandButton.setImage(UIImage(named: "btn_dropdown"), for: .normal)
        }
    }
    
    @IBAction func touchUpExpandButton(_ sender: Any) {
        
        if expandHandler != nil{
            //Handler가 초기화되어있지 않으면 Event 막음
            print("333")
            if expandButton.currentImage == UIImage(named: "btn_dropdown"){
                expandButton.setImage(UIImage(named: "btn_dropup_24"), for: .normal)
                expandHandler?()
            }else{
                expandButton.setImage(UIImage(named: "btn_dropdown"), for: .normal)
                contractHandler?()
            }
        }
    }
    
    
}

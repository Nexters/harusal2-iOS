//
//  HomeViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeEmptyViewController: BaseViewController {

    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var setDepositButton : UIButton!
    @IBOutlet weak var menuBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var receiptBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var containsetDepositButtonView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func addComponents() {
        
        
        
        
        
        
    }
    
    override func setConstraints() {
        
        label.preferredMaxLayoutWidth = 176
        containsetDepositButtonView.roundView(by: 80)
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

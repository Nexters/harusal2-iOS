//
//  HomeViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var menuBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var receiptBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var todayMoneyDescriptionLabel : UILabel!
    @IBOutlet weak var todayMoneyLabel : UILabel!
    @IBOutlet weak var leftDayForMonthLabel : UILabel!
    @IBOutlet weak var leftMoneyForMonthLabel : UILabel!
    @IBOutlet weak var addreceiptButton : UIButton!
    @IBOutlet weak var seeReceiptView : UIButton!
    @IBOutlet weak var containLeftLabelView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setConstraints() {
        addreceiptButton.roundView(by: 2)
        containLeftLabelView.roundView(by: 80)
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

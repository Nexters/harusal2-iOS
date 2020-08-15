//
//  ListEditViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/15.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class ListEditViewController: BaseViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var desTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setConstraints() {
        moneyTextField.keyboardType = .numberPad
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

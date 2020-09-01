//
//  EditMoneyViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class EditMoneyViewController: UIViewController {

    @IBOutlet weak var bugetPreDayLabel: UILabel!
    @IBOutlet weak var editMoneyText: UITextField!
    @IBOutlet weak var editMoneyTextConverter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.editMoneyText.becomeFirstResponder()
    }
    
    func setInitView() {
        // TODO : DB에서 값 가져와서 초기 데이터 세팅
        bugetPreDayLabel.text = "15,000원"
        editMoneyText.text = "200,000"
        editMoneyTextConverter.text = "20만원"
    }
}

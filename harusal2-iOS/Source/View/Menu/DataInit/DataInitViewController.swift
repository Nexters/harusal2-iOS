//
//  DataInitViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

class DataInitViewController: UIViewController {
    
    let viewModel = DataInitViewModel()
    @IBOutlet weak var initView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView.roundView(by: 50)
        
    }
    
    @IBAction func tappedCancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func tappedBG(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func tappedDone(_ sender: Any) {
        viewModel.removeData()
        self.dismiss(animated: false, completion: nil)
    }
    
}

//
//  EditDayViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class EditDayViewController: UIViewController {
    
    let viewModel = EditDayViewModel()
    @IBOutlet weak var dayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayView.roundView(by: 50)
        
    }
    
    @IBAction func tappedCancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func tappedBG(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func tappedDone(_ sender: Any) {
        viewModel.setStartDate(date: Date())
        viewModel.setBudget()
        self.dismiss(animated: false, completion: nil)
    }
    
}

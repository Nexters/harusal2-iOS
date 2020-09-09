//
//  InitDayPickerViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitDayPickerViewController: UIViewController {
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var monthlyBudgetDurationLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var durationLabel: UILabel!
    var viewModel = InitViewModel()
    let sp = SharedPreference.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBlack()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setInitView()
    }
    
    
    
    @IBAction func tappedDoneButton(_ sender: Any) {

        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigation") else{
            return
        }
        
        guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
        
        sp.setFirstRun()
        self.viewModel.setStartDate(date: Date())
        self.viewModel.setBudget()
        self.slideLeft(from: snapshot, to: vc)
    }
    
    
    
}

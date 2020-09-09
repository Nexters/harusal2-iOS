//
//  InitDayViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitDayViewController: BaseViewController {
    
    @IBOutlet var dayLabel: [UILabel]?
    let sp = SharedPreference.shared
    
    var day: String = ""
    var viewModel = InitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBlack()
        day = String(viewModel.today)
        setTodayLabel()
    }
    
    func setTodayLabel(){
        dayLabel?[0].text = day
        dayLabel?[1].text = day
    }
    
    @IBAction func selectToday(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigation") else{
                return
            }
        guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else {
            return
                    
        }
        
        sp.setFirstRun()
        self.viewModel.setStartDate(date: Date())
        self.viewModel.setBudget()
        self.slideLeft(from: snapshot, to: vc)
       
        
        
    }
    
    
    
    @IBAction func selectDifferentDay(_ sender: Any) {
        if let navi = self.navigationController, let sb = self.storyboard{
            guard let pickerVC = sb.instantiateViewController(identifier: "InitDayPickerViewController") as? InitDayPickerViewController else{
                return
            }
            pickerVC.viewModel = self.viewModel
            navi.pushViewController(pickerVC, animated: true)
        }else{
            return
        }
    }
    
//    @IBAction func tappedCloseButton(_ sender: Any) {
//        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigation") else{
//            return
//        }
//        
//        guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
//        
//        self.popLeft(from: snapshot, to: vc)
//    }
}

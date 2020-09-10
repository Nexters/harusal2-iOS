//
//  SlideMenuViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/13.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class SlideMenuViewController: BaseViewController {
    @IBOutlet weak var alarmView: UIView!
    @IBOutlet weak var moneyView: UIView!
    @IBOutlet weak var dayView: UIView!
    @IBOutlet weak var initView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "환경설정"
        self.setNavigationBlack()
        setEventHandler()
        // Do any additional setup after loading the view.
    }
    
    func setEventHandler(){
        let alarmTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedAlarm))
        alarmView.addGestureRecognizer(alarmTap)
        
        let moneyTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMoney))
        moneyView.addGestureRecognizer(moneyTap)
        
        let dayTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedDay))
        dayView.addGestureRecognizer(dayTap)
        
        let initTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedinit))
        initView.addGestureRecognizer(initTap)
    }
    
    @IBAction func tappedCloseButton() {
    
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigation") else{
                    return
                }
                
                guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
        self.popLeft(from: snapshot, to: vc)
        
    
    }
    
    @objc func tappedAlarm() {
        if let navi = self.navigationController, let storyBoard = self.storyboard{
            guard let alarmVC = storyBoard.instantiateViewController(identifier: "AlarmViewController") as? AlarmViewController else{
                return
            }
            print("alarm")
            navi.pushViewController(alarmVC, animated: true)
        }else{
            return
        }
    }
    
    @objc func tappedMoney() {
        if let navi = self.navigationController, let storyBoard = self.storyboard{
            guard let moneyVC = storyBoard.instantiateViewController(identifier: "EditMoneyViewController") as? EditMoneyViewController else{
                return
            }
            navi.pushViewController(moneyVC, animated: true)
        }else{
            return
        }
    }
    
    @objc func tappedDay() {
        if let navi = self.navigationController, let storyBoard = self.storyboard{
            guard let alertVC = storyBoard.instantiateViewController(identifier: "EditDayViewController") as? EditDayViewController else{
                return
            }
            
            alertVC.modalPresentationStyle = .overCurrentContext
            present(alertVC, animated: false, completion: nil)
        }else{
            return
            
        }
    }
    
    @objc func tappedinit() {
        if let navi = self.navigationController, let storyBoard = self.storyboard{
            guard let initVC = storyBoard.instantiateViewController(identifier: "DataInitViewController") as? DataInitViewController else{
                return
            }
            
            initVC.modalPresentationStyle = .overCurrentContext
            present(initVC, animated: false, completion: nil)
        }else{
            return
            
        }
    }
    
    
    
    

}

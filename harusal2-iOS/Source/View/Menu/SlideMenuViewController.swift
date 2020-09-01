//
//  SlideMenuViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/13.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import RxCocoa

class SlideMenuViewController: BaseViewController {
    @IBOutlet weak var alarmView: UIView!
    @IBOutlet weak var alarmButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "환경설정"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedAlarmButton(_ sender: Any) {
        
        if let navi = self.navigationController, let storyBoard = self.storyboard{
            guard let alarmVC = storyBoard.instantiateViewController(identifier: "AlarmSlideViewController") as? AlarmSlideViewController else{
                return
            }
            
            navi.pushViewController(alarmVC, animated: true)
            
        }else{
            
        }
        
    }
    
    

}

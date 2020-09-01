//
//  InitDayPickerViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitDayPickerViewController: BasePickerView {
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func getMonthAndDay()-> (Int,Int){
        // TODO: DB에서 오늘 날짜 가져오기
        return (9,10)
    }
    
    @IBAction func tappedDoneButton(_ sender: Any) {

        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigation") else{
            return
        }
        
        guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
        
        self.slideLeft(from: snapshot, to: vc)
    }
    
}

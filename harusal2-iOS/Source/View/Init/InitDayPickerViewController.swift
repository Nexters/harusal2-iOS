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
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "nav2") else{
            return
        }
       
        
//        UIView *snapShot = [self.window snapshotViewAfterScreenUpdates:YES];
//        [viewController.view addSubview:snapShot];
//        self.window.rootViewController = viewController;
//        [UIView animateWithDuration:0.3 animations:^{
//            snapShot.layer.opacity = 0;
//            snapShot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
//        } completion:^(BOOL finished) {
//            [snapShot removeFromSuperview];
//        }];
//
//        if let root = self.view.window?.rootViewController){
//            self.view.window?.rootViewController = vc
//        } else{
//            return
//        }
        
        
        guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
        vc.view.addSubview(snapshot)
        self.view.window?.rootViewController = vc

        UIView.animate(withDuration: 0.3, animations: {
//            snapshot.layer.opacity = 0
            
//            CGAffineTransform(translationX: 0, y: 0)
            snapshot.transform = CGAffineTransform(translationX: -400, y: 0)
            
//            snapshot.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
        }, completion: { finish in
            snapshot.removeFromSuperview()
        })
        
        
        
//        self.view.window?.rootViewController = vc
    }
}

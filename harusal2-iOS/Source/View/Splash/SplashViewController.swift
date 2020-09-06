//
//  SplashViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    let sp = SharedPreference.shared
    let db = DBRepository.shared
    @IBOutlet weak var imgViewBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        openOnBoarding()
    }
    
    func openOnBoarding(){
        if sp.openOnBoarding(){
            print("한번 봄")
            isFirstRun()
         }else{
            print("안봄")
             guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardingNavigation") else{
                                    return
                                }

             guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
                                
                        
             DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                                     self.popLeft(from: snapshot, to: vc)
                                })
         }
        
         
    }
    
    func isFirstRun(){
        if sp.isFirstRun(){
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "InitNavigation") else{
                        return
                    }
                    
            guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                self.popLeft(from: snapshot, to: vc)
            })
                   
        }else{
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigation") else{
                                   return
                               }

            guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
                               
                       
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                                    self.popLeft(from: snapshot, to: vc)
                               })
        }
        
        //Init화면 나오지 않는 경우
        // 1. 저장되어 있는 Budget이 있는 경우
        // if 저장되어있는 Budget이 있는데, 마지막 Budget의 EndDate가 오늘 이전일 경우에는?
        // -> Splash에서 마지막 Budget의 startDate.month+1, 로 재계산?
        // if (startDate.month == 12)
        // -> startDate.month = 1, startDate.year+1 로 계산
       
        
    }

}

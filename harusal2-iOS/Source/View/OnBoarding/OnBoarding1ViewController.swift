//
//  OnBoarding1ViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import Lottie

class OnBoarding1ViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    let sp = SharedPreference.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipeGestureRecognizer.direction = .left
        self.view.addGestureRecognizer(leftSwipeGestureRecognizer)
        sp.setOnBoarding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationView.loopMode = .loop
        animationView.play()
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            
            if let navi = self.navigationController, let sb = self.storyboard{
                guard let onBoarding2VC = sb.instantiateViewController(identifier: "OnBoarding2ViewController") as? OnBoarding2ViewController else {
                    return
                }
                navi.pushViewController(onBoarding2VC, animated: true)
            }
        }
            
       
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  OnBoarding2ViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import Lottie

class OnBoarding2ViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipeGestureRecognizer.direction = .left
        rightSwipeGestureRecognizer.direction = .right
        self.view.addGestureRecognizer(leftSwipeGestureRecognizer)
        self.view.addGestureRecognizer(rightSwipeGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationView.loopMode = .loop
        animationView.play()
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            
            if let navi = self.navigationController, let sb = self.storyboard{
                guard let onBoarding3VC = sb.instantiateViewController(identifier: "OnBoarding3ViewController") as? OnBoarding3ViewController else {
                    return
                }
                navi.pushViewController(onBoarding3VC, animated: true)
            }
        }
            
        if (sender.direction == .right) {
            if let navi = self.navigationController{
                navi.popViewController(animated: true)
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

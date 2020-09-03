//
//  OnBoarding3ViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import Lottie

class OnBoarding3ViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()

    
            let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
            
            rightSwipeGestureRecognizer.direction = .right
            self.view.addGestureRecognizer(rightSwipeGestureRecognizer)
            // Do any additional setup after loading the view.
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationView.loopMode = .loop
        animationView.play()
    }
        
        @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
            if (sender.direction == .right) {
                if let navi = self.navigationController{
                    navi.popViewController(animated: true)
                }
            }
        }
    

    @IBAction func tappedDoneButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "InitNavigation") else{
                    return
                }
                
        guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }

        DispatchQueue.main.async{
            self.popLeft(from: snapshot, to: vc)
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

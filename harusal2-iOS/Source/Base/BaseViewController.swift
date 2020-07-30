//
//  BaseViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addComponents()
        self.setConstraints()
        self.onBind()
        // Do any additional setup after loading the view.
    }
    
    func addComponents(){
        
    }
    
    func setConstraints(){
        
    }
    
    func onBind(){
        
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

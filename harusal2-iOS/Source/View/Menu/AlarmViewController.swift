//
//  AlarmViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var alarmTableView: UITableView!
    @IBOutlet weak var tableItemTimeLabel: UILabel!
    @IBOutlet weak var tableItemSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        
        self.alarmTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

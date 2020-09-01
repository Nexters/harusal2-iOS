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
    
    private var items: [String] = ["아침 AM 9:00", "점심 PM 12:00", "저녁 PM 8:00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell") as? AlarmCell else {
            return UITableViewCell()
        }
        
        cell.tableItemTimeLabel.text = items[indexPath.row]

        return cell
    }
}

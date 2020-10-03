//
//  AlarmViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import UserNotifications

class AlarmViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var alarmTableView: UITableView!
    let sp = SharedPreference.shared
    
    private var items: [String] = ["아침 AM 9:00", "점심 PM 12:00", "저녁 PM 8:00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DB에서 불러오기
        self.setNavigationBlack()
        self.alarmSwitch.isOn = false
        self.navigationItem.title = "알람 설정"
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        setAlarmOnOff()
    }
    
    func setAlarm(flag: Bool, hour: Int, minute: Int, id: String){
        self.sp.setAlarmTime(flag: flag, id: id)
        
        if flag{
            let content = UNMutableNotificationContent()
             content.title = "하루살이"
             content.body = "오늘의 기록을 남겨보세요!"
            content.sound = UNNotificationSound.default
            content.badge = 1

             var date = DateComponents()
             date.hour = hour
             date.minute = minute
            
             let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
             let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
        else{
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [id])
        }
    }
    
    func setAlarmOnOff(){
        if sp.getAlarm(){
            //8,12,20 은 켜놨지만 전체 PUSH를 끄고 킬 때 다시 Notification 삽입
            self.alarmSwitch.isOn = true
            self.alarmTableView.reloadData()
            
        }
        else{
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound], completionHandler: {didAllow,Error in
                self.sp.setAlarm(flag: didAllow)
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if alarmSwitch.isOn{
            return items.count
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell") as? AlarmCell else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.id = "9AM"
        case 1:
            cell.id = "12PM"
        case 2:
            cell.id = "8PM"
        default:
            cell.id = ""
        }
        cell.alarmHandler = self.setAlarm
        cell.updateUI(flag : sp.getAlarmTime(id: cell.id))
        cell.tableItemTimeLabel.text = items[indexPath.row]

        return cell
    }
    @IBAction func tappedSwitch(_ sender: Any) {
        
        if self.alarmSwitch.isOn{
            //8,12,20 은 켜놨지만 전체 PUSH를 끄고 킬 때 다시 Notification 삽입
            print("있는 것들만 삽입")
            setAlarm(flag: sp.getAlarmTime(id: "9AM"), hour: 8, minute: 0, id: "9AM")
            setAlarm(flag: sp.getAlarmTime(id: "12PM"), hour: 12, minute: 0, id: "12PM")
            setAlarm(flag: sp.getAlarmTime(id: "8PM"), hour: 20, minute: 0, id: "8PM")
        }
        else{
            print("모두삭제")
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["9AM", "12PM", "8PM"])
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound], completionHandler: {didAllow,Error in
                self.sp.setAlarm(flag: didAllow)
            })
        }
        
        self.alarmTableView.reloadData()
    }
}



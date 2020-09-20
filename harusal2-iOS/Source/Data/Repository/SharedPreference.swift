//
//  SharedPreference.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation

class SharedPreference{
    static let shared = SharedPreference()
    let sp = UserDefaults.standard
    
    func isFirstRun() -> Bool{
        if sp.string(forKey: "Run") == "Run"{
            //처음 아님
            return false
        }else{
            //처음 아님
            return true
        }
    }
    
    func openOnBoarding() -> Bool{
        if sp.bool(forKey: "OnBoarding"){
            //처음 아님
            return true
        }else{
            //처음임
            return false
        }
    }
    
    func setOnBoarding(){
        sp.set(true, forKey: "OnBoarding")
    }
    
    func setFirstRun(){
        sp.setValue("Run", forKey: "Run")
    }
    
    func removeData(){
        sp.removeObject(forKey: "Run")
        sp.removeObject(forKey: "OnBoarding")
        sp.removeObject(forKey: "Alarm")
        sp.removeObject(forKey: "9AM")
        sp.removeObject(forKey: "12PM")
        sp.removeObject(forKey: "8PM")
    }
    
    func setAlarm(flag: Bool){
        sp.setValue(flag, forKey: "Alarm")
    }
    
    func getAlarm() -> Bool{
        return sp.bool(forKey: "Alarm")
    }
    
    func setAlarmTime(flag: Bool, id: String){
        sp.setValue(flag, forKey: id)
    }
    
    func getAlarmTime(id: String) -> Bool{
        return sp.bool(forKey: id)
    }
}

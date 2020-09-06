//
//  AppDelegate.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
        schemaVersion: 7,
        migrationBlock: { migration, oldSchemaVersion in
          if (oldSchemaVersion < 7) {
            // The enumerateObjects(ofType:_:) method iterates
            // over every Person object stored in the Realm file
            migration.enumerateObjects(ofType: BreakDown.className()) { oldObject, newObject in
              // combine name fields into a single field
//                let dateString = oldObject?["date"]
//                print(dateString)
//
//                newObject!["date"] = Converter.shared.convertString(dateString as? String ?? "")
            }
            migration.enumerateObjects(ofType: Budget.className()) { oldObject, newObject in
              // combine name fields into a single field
//              let start = oldObject?["startDate"]
//              let end = oldObject?["endDate"]
//                
//                newObject!["startDate"] = Converter.shared.convertString(start as? String ?? "")
//                newObject!["endDate"] = Converter.shared.convertString(end as? String ?? "")
            }
          }
        })
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


//
//  AppDelegate.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/16.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        fetchAppInfo()
        
        
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


extension AppDelegate {
    
    private func fetchAppInfo() {
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "main.json", withExtension:nil)
                else {
                    print("main json is nil")
                    return
            }
            
            let data = NSData(contentsOf: url)
            
            let documentDir: String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,.userDomainMask , true)[0]
            let jsonPath = (documentDir as NSString).appendingPathComponent("main.json")
            
            data?.write(toFile: jsonPath, atomically: true)
            
            
            //读取json
            //            do{
            //                let data = try Data(contentsOf: url)
            //                let jsonData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            //                let jsonArr = jsonData as! NSArray
            //                for dic in jsonArr {
            //                    print(dic)
            //                }
            //
            //            }catch{
            //                print("读取main.失败",error)
            //            }
            
        }
    }
    
}

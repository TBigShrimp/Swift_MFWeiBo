//
//  MFWeiBoSingleton.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/22.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation

class MFWeiBoSingleton {
    
    public static let shared = MFWeiBoSingleton()
        
    private init(){}
    
    var token: String?{
        
        let token = UserDefaults.standard.object(forKey: "token") as? String
        if let token = token {
            return token
        }
        return nil
    }
    
    var uid: String?{
        
        let uid = UserDefaults.standard.object(forKey: "uid") as? String
        if let uid = uid {
            return uid
        }
        return nil
    }

    
    
    var isLogin: Bool {
        
        let token = UserDefaults.standard.object(forKey: "token") as? String
         
        if token != nil {
            return true
        }
        return false
        
    }
    
    
//    public static let shared1 = {
//
//        return MFWeiBoSingleton()
//    }()
}



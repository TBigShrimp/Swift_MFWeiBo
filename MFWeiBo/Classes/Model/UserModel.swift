//
//  UserModel.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/22.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation

class UserModel: Convertible {
    
    
    var id: Int = 0
    var screen_name: String = ""
    
    var profile_image_url: String = ""
    
    // 认证类型（-1:没有认证, 0:认证用户, 2,3,5:企业认证, 220:达人）
    var verified_type: Int = 0
    
    // 会员等级 0~6
    var mbrank: Int = 0
    
    required init() {
        
    }
    
}

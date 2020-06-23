//
//  StatusPicture.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/22.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation
class StatusPicture: Convertible {
    
    var thumbnail_pic: String? {
        didSet {
            //处理缩略图地址
            thumbnail_pic = thumbnail_pic?.replacingOccurrences(of: "/thumbnail/", with: "/wap360/")
            //原图
            largePic = thumbnail_pic?.replacingOccurrences(of: "/wap360/", with: "/large/")
        }
    }
    var largePic: String?
    required init() {}

}

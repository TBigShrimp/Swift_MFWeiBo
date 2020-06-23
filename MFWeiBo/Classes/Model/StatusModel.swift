//
//  StatusModel.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/22.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation
class StatusModel: Convertible {
    
    var id: Int64 = 0
    var text: String?
    var user: UserModel?
    var reposts_count = 0
    var comments_count = 0
    //点赞数
     var attitudes_count = 0
    
    var pic_urls: [StatusPicture]?
    
    //现在新浪的api接口没有创建日期了
    var create_at: String?{
        didSet{
            createDate = Date.mn_sinaDate(string: create_at)
        }
    }
    
    var createDate: Date?
    
    var source: String?{
        didSet{
            source = "来自" + (source?.mn_href()?.text ?? "")
        }
    }
    //被转发微博
    var retweeted_status: StatusModel?
    
    required init() {}

}

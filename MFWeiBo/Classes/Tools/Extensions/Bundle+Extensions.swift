//
//  Bundle+Extensions.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/17.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation


extension Bundle {

    // 计算型属性类似于函数，没有参数，有返回值
    var namespace: String {
        infoDictionary?["CFBundleName"] as? String ?? ""
    }
}

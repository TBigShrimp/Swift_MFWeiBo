//
//  MFLog.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/19.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation


func mf_debugLog<T>(_ msg: T,file:NSString = #file, line: Int = #line, fn: String = #function) {
    #if DEBUG
    let prefix = "\(file.lastPathComponent) line:\(line) function:\(fn):"
    print(prefix,msg)
    #endif
}

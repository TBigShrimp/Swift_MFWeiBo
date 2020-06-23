//
//  MFNavigationBar.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/21.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit

class MFNavigationBar: UINavigationBar {
    
    //Fix: navigation-contentView y = 0 bug.
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for subview in self.subviews {
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground") {
                subview.frame = self.bounds
            } else if stringFromClass.contains("UINavigationBarContentView") {
                subview.frame = CGRect(x: 0,
                                       y: MF_statusBarHeight,
                                       width: UIScreen.mf_ScreenWidth,
                                       height: MF_naviContentHeight)
            }
        }
    }
}

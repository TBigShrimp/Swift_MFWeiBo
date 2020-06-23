//
//  UILabel+Extension.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/21.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation

extension UILabel {
    class func mf_label(text: String,fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = self.init()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
        
    }
}

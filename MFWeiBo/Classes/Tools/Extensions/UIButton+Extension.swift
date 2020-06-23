//
//  UIButton+Extension.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/18.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    
    class func mf_imageButton(normalImageName: String, backgroundImageName: String) -> UIButton {
        
        let button = UIButton()
        button.setImage(UIImage(named: normalImageName), for: UIControl.State.normal)
        
        let  highImageName = normalImageName + "_highlighted"
        button.setImage(UIImage(named: highImageName), for: .highlighted)
        
        button.setBackgroundImage(UIImage(named: backgroundImageName), for: .normal)
        
        let backgroundImageHL = backgroundImageName + "_highlighted"
        button.setBackgroundImage(UIImage(named: backgroundImageHL), for: .highlighted)

        return button
    }
    
    
    class func mf_textButton(title: String, fontSize: CGFloat, normalColor: UIColor,highlightedColor: UIColor, backgroundImageName: String? = nil) -> UIButton {
        
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.setTitle(title, for: .normal)
        button.setTitleColor(normalColor, for: .normal)
        button.setTitleColor(highlightedColor, for: .highlighted)
        if let backgroundImageName = backgroundImageName {
            button.setBackgroundImage(UIImage(named: backgroundImageName), for: .normal)
            let backgroundImageNameHL = backgroundImageName + "_highlighted"
            button.setBackgroundImage(UIImage(named: backgroundImageNameHL), for: .highlighted)
        }
        return button
        
    }
}

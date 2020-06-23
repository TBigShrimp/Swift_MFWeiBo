//
//  MFTitleButton.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/23.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit

class MFTitleButton: UIButton {
    
    init(title: String?, target: Any?, action: Selector) {
        super.init(frame: CGRect())
        if title == nil {
            setTitle("首页", for: .normal)
        }else {
            setTitle(title, for: .normal)
            setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
            setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        }
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        setTitleColor(UIColor.darkGray, for: .normal)
        sizeToFit()
        addTarget(target, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let titleLabel = titleLabel, let imageView = imageView else {
            return
        }
        
        //设置文字在做，图片在右
        titleLabel.frame.origin.x = 0
        imageView.frame.origin.x = titleLabel.bounds.width

    }
    
}

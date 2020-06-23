//
//  HomeBaseCell.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/22.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit

class HomeBaseCell: UITableViewCell {
    
    var viewModel:StatusModel?{
        didSet {
            
        }
    }
    
    var avatarImage = UIImageView()
    var nameLabel = UILabel()
    var levelIconView = UIImageView(image: UIImage(named: "common_icon_membership"))
    var timeLabel = UILabel()
    var sourceLabel = UILabel()
    var vipIconView = UIImageView(image: UIImage(named: "avatar_enterprise_vip"))
    var contentLabel = MFLabel()
    var repostLabel = MFLabel()
    //toolButton
//    var bottomView:MNStatusToolView = MNStatusToolView(parentView: nil)
    
//    var contentPictureView = MNStatusPictureView(parentView: nil, topView: nil, bottomView: nil)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews(){
        addSubview(avatarImage)
        addSubview(nameLabel)
        
        avatarImage.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.bottom.equalToSuperview()
            
        }
        nameLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
}



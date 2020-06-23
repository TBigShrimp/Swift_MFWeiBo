//
//  NoLoginView.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/21.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation

protocol LoginDelegate: class{
    func clickLogin()
    func clickRegister()
}

class NOLoginView: UIView {
    
    weak var delegate: LoginDelegate?
    
    var visitorInfo: [String: String]? {
        didSet {
            guard let imageName = visitorInfo?["imageName"],
                let message = visitorInfo?["message"]
            else {
                return
            }
            if imageName == "" {
                mf_debugLog("page is Home page")
                startAnimation()
                return
            }
            
            iconView.image = UIImage(named: imageName)
            tipLabel.text = message
            //not home page
            houseView.isHidden = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        noLoginViewlayoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        backgroundColor = UIColor.init(rgb: 0xEDEDED)
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseView)
        addSubview(tipLabel)
        addSubview(registBtn)
        addSubview(loginButton)
        
        tipLabel.textAlignment = NSTextAlignment.center
        
        loginButton.addTarget(self, action: #selector(clickLogin), for: .touchUpInside)
        registBtn.addTarget(self, action: #selector(clickRegister), for: .touchUpInside)

    }
    private func startAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2.0 * .pi
        animation.repeatCount = MAXFLOAT
        animation.duration = 15
        //动画完成不删除(连续动画)，如果父view销毁，动画会一起被销毁
        animation.isRemovedOnCompletion = false
        iconView.layer.add(animation, forKey: nil)
    }
    private func noLoginViewlayoutSubviews() {
        
        iconView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.snp.centerY).offset(-60)
        }
        
        houseView.snp.makeConstraints { (make) in
            make.center.equalTo(iconView)
        }
        
        tipLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(houseView.snp.bottom).offset(60)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(120)
            make.top.equalTo(tipLabel.snp.bottom).offset(20)
            make.width.equalTo(80)
        }
        
        registBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-120)
            make.top.equalTo(loginButton)
            make.width.equalTo(loginButton)
        }
        
        
    }
    
    private lazy var iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    lazy var maskIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    private lazy var houseView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    private lazy var tipLabel = UILabel.mf_label(text: "talk is cheep, show me the code", fontSize: 16, color: UIColor.darkGray)
    private lazy var registBtn = UIButton.mf_textButton(title: "注册",
                                                        fontSize: 16,
                                                        normalColor: UIColor.orange,
                                                        highlightedColor: UIColor.black,
                                                        backgroundImageName: "common_button_white_disable")
    
    private lazy var loginButton = UIButton.mf_textButton(title:"登录",
                                                          fontSize: 16,
                                                          normalColor: UIColor.orange,
                                                          highlightedColor: UIColor.black,
                                                          backgroundImageName: "common_button_white_disable")
    
}


extension NOLoginView {
    
    @objc func clickLogin() {
        delegate?.clickLogin()
    }
    @objc func clickRegister() {
        delegate?.clickRegister()
    }
    
}

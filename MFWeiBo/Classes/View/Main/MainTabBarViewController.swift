//
//  MainTabBarViewController.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/17.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    private lazy var tabbarCenterButton: UIButton = UIButton.mf_imageButton(normalImageName: "tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        setUpChildVcs()
        setupCenterButton()
        tabBar.barTintColor = UIColor.white

        NotificationCenter.default.addObserver(self, selector: #selector(userLogin), name: Notification.Name(MFUserShouldLoginNotification), object: nil)
        
    }
    
    @objc private func centenButtonClick() {
        mf_debugLog("centenButtonClick")
    }
    
    @objc private func userLogin(noti:Notification) {
        let oauth = OAuthViewController()
        let navi = UINavigationController(rootViewController: oauth)
        present(navi, animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension MainTabBarViewController {
    
    
    private func setupCenterButton() {
        tabBar.addSubview(tabbarCenterButton)
        let count = CGFloat(viewControllers?.count ?? 0)
        let width = tabBar.bounds.width / count
        let leftItemCount: CGFloat = 2
        
        tabbarCenterButton.frame = tabBar.bounds.insetBy(dx: leftItemCount * width, dy: 0)
        tabbarCenterButton.addTarget(self, action: #selector(centenButtonClick), for: .touchUpInside)
    }
    
    
    
    private func setUpChildVcs() {
        
        let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (documentDir as NSString).appendingPathComponent("main.json")
        var data = NSData(contentsOfFile: jsonPath)
        if data == nil {
            let path = Bundle.main.path(forResource: "main", ofType: "json")
            if let path = path {
                data = NSData(contentsOfFile: path)
            }
        }
        
        do {
            let array = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:AnyObject]]
            
            var arrayM = [UIViewController]()
            if let array = array {
                for dic in array {
                    arrayM.append(initController(dic: dic))
                }
            }
            viewControllers = arrayM
            
        } catch  {
            print(error)
        }
    }
    
    private func initController(dic:[String:Any]) -> UIViewController {
        
        guard let clsName = dic["clsName"] as? String,
        let title = dic["title"] as? String,
        let imageName = dic["imageName"] as? String,
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? BaseViewController.Type,
        let visitorDic = dic["visitorInfo"] as? [String: String]
        else{
            return UIViewController()
        }
        let vc = cls.init()
        vc.title = title
        vc.visitorInfo = visitorDic
        let normalImage = "tabbar_" + imageName
        let selectedImage = "tabbar_" + imageName + "_selected"
        vc.tabBarItem.image = UIImage(named: normalImage)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        
        //swift5: set UIBarItem title color
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.gray,
            NSAttributedString.Key.backgroundColor : UIColor.gray,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)
        ]
        vc.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        
        let attributes2 = [
            NSAttributedString.Key.foregroundColor : UIColor.orange,
            NSAttributedString.Key.backgroundColor : UIColor.orange,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)
        ]
        vc.tabBarItem.setTitleTextAttributes(attributes2, for: .selected)
        let navi = BaseNavigationViewController(rootViewController: vc)
        return navi

    }
}

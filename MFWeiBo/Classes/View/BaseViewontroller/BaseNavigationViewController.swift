//
//  BaseNavigationViewController.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/21.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
//        if let vc = viewController as? BaseViewController {
//            
//            var  title = "返回"
//            if children.count == 1 {
//                title = children.first?.title ?? "返回"
//            }
//            
//            vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.plain, target: self, action: #selector(popViewController(animated:)))
//            
//        }
        
        super.pushViewController(viewController, animated: animated)
    }

   

}

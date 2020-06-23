//
//  BaseViewController.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/19.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit
import Foundation
class BaseViewController: UIViewController {
    
    lazy var navigationBar = MFNavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.mf_ScreenWidth, height: MF_naviBarHeight))
    lazy var noLoginView = NOLoginView(frame: view.bounds)
    var visitorInfo: [String: String]?
    lazy var naviItem = UINavigationItem()
    
    var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNavigationBar()
        
        registNotification()
        
        
        setUI()
        
    }
    private func registNotification() {
        //login success
        NotificationCenter.default.addObserver(forName: NSNotification.Name(MFUserLoginSuccessNotification), object: nil, queue: OperationQueue.main) { [weak self] _  in
            self?.naviItem.leftBarButtonItem = nil
            self?.naviItem.rightBarButtonItem = nil
            
            
                self?.setUI()
                self?.loadData()
            
            
        }
    }
    
    func setUI() {
        if MFWeiBoSingleton.shared.isLogin {
            setLoginUI()
            setupNaviTitle()
        }else{
            setUINologinView()
        }
    }
    
    func setupNaviTitle() {
        
    }
    
    private func setUINologinView() {
        noLoginView.visitorInfo = visitorInfo
        noLoginView.delegate = self
        view.insertSubview(noLoginView, belowSubview: navigationBar)
    }
    
    private func setupNavigationBar(){
        
        view.addSubview(navigationBar)
        navigationBar.items = [naviItem]
        //navigationBar background color
        navigationBar.barTintColor = UIColor.init(rgb: 0xF6F6F6)
        //set title color
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.darkGray
        ]
        //set system item title color
        navigationBar.backgroundColor = UIColor.init(rgb: 0xF6F6F6)
    }
}

extension BaseViewController: LoginDelegate {
    
    //MARK: - LoginDelegate
    func clickLogin() {
        NotificationCenter.default.post(name: NSNotification.Name(MFUserShouldLoginNotification), object: nil)
    }
    
    func clickRegister() {
        
    }
    
    
}

//登录状态UI
extension BaseViewController: UITableViewDelegate,UITableViewDataSource {
    
    private func setLoginUI() {
        
        tableView = UITableView(frame: view.bounds, style: UITableView.Style.plain)
//        tableView?.register(T##cellClass: AnyClass?##AnyClass?, forCellReuseIdentifier: <#T##String#>)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.gray
        view.insertSubview(tableView!, belowSubview: navigationBar)
        tableView?.snp.makeConstraints({ (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        })
    }
    private func loadData() {
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let row1 = indexPath.row
        cell.textLabel?.text = String(row1)
        return cell
    }
}

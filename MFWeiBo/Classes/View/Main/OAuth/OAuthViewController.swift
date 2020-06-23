//
//  OAuthViewController.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/19.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit
import WebKit
class OAuthViewController: UIViewController {
    
    private lazy var wkWebView = WKWebView()
    
    override func loadView() {
        title = "登录微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItem.Style.plain, target: self, action: #selector(closeWebView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: UIBarButtonItem.Style.done, target: self, action: #selector(autoInput))
        
        //设置webview
        view = wkWebView
        view.backgroundColor = UIColor.white
        
        wkWebView.navigationDelegate = self
        wkWebView.scrollView.isScrollEnabled = false
        
        let imgViewA = UIImageView(frame: CGRect(x: 100, y: 200, width: 150, height: 150));
        self.view.addSubview(imgViewA);
        imgViewA.kf.indicatorType = .activity
        imgViewA.kf.setImage(with: URL(string: ""),options:[.transition(.fade(0.5))]);

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl()
        
    }
    private func loadUrl() {
        
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(MFAppKey)&redirect_uri=\(MFredirectUri)"
        guard let url = URL(string: urlString) else { return  }
        let request = URLRequest(url: url)
        wkWebView.load(request)
        
    }
    
    
    func fetchUserInfo() {
        guard let uid = UserDefaults.standard.object(forKey: "uid"),
            let token = UserDefaults.standard.object(forKey: "token")
        else {
            return
        }
        let urlString = "https://api.weibo.com/2/users/show.json"
        let parms = ["uid":uid as! String,"access_token":token as! String] as [String: AnyObject]
        
        AF.request(urlString, method: .get, parameters: parms).responseJSON { (respose) in
            switch respose.result{
            case .success(let value):
                mf_debugLog("valueuserInfo============:\(value)")

            case .failure(_):
                break
            }
        }
        
    }

    
    @objc func closeWebView() {
        dismiss(animated: true, completion: nil)
    }
    @objc func autoInput() {
        //动态注入JS
        let account = "tianmingfu@126.com"
        let password = "fufu19900303."
        let js =  "document.getElementById('userId').value = '\(account)';" + "document.getElementById('passwd').value = '\(password)';"
        
        wkWebView.evaluateJavaScript(js, completionHandler: nil)
        
    }
    
}

extension OAuthViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        mf_debugLog("url =======> \(String(describing: webView.url?.absoluteString))")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        if webView.url?.absoluteString.hasPrefix(MFredirectUri) == false {
//            mf_debugLog("请求 url =======> \(String(describing: webView.url?.absoluteString))")
            return
        }
        
        if webView.url?.query?.hasPrefix("code=") == false {
            mf_debugLog("取消授权")
            closeWebView()
            return
        }
        
        let code = webView.url?.query?.substring(from: "code=".count) ?? ""
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let parms = ["client_id":MFAppKey,
                     "client_secret":MFAppSecret,
                     "grant_type":"authorization_code",
                     "code":code,
                     "redirect_uri":MFredirectUri]


        AF.request(urlString, method: .post, parameters: parms).responseJSON { (respose) in
            
            switch respose.result {
            case .success(let value):
                let dic = JSON(value)
                let token = dic["access_token"].string
                let uid = dic["uid"].string

                UserDefaults.standard.setValue(token, forKey: "token")
                UserDefaults.standard.setValue(uid, forKey: "uid")
                
                NotificationCenter.default.post(name: NSNotification.Name(MFUserLoginSuccessNotification), object: nil)

//                remind_in
//                expires_in
//                isRealName
                self.fetchUserInfo()
                
                self.closeWebView()
                
            case .failure(let failDic):
                mf_debugLog(failDic)
            }
        }
    }
}

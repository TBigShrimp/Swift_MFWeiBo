//
//  HomeViewController.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/17.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import UIKit

private let cellID = "HomecellId"


class HomeViewController: BaseViewController {
    
    var dataSources: Array<StatusModel>? = [StatusModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 200
        tableView?.separatorStyle = .none
        
        naviItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: UIBarButtonItem.Style.done, target: self, action: #selector(showFridends))
        
        //        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        //        if MFWeiBoSingleton.shared.isLogin {
        //            let parms = ["access_token":MFWeiBoSingleton.shared.token]
        //
        //            AF.request(urlString, method: .get,parameters: parms).responseJSON { [weak self](response) in
        //                switch response.result {
        //                case .success(let value):
        //                    guard let dic = value as? [String: Any] else { return }
        //                    // 调用json数组的modelArray方法即可
        //                    guard let dataArray = dic["statuses"] as? [[String: Any]] else { return  }
        //                    self?.dataSources = dataArray.kj.modelArray(type: StatusModel.self) as? Array<StatusModel>
        //                    self?.tableView?.reloadData()
        //                case .failure(_):
        //                    self?.tableView?.reloadData()
        //                    break
        //                }
        //            }
        //        }
        
        
        
        //        读取homejson
        if let url = Bundle.main.url(forResource: "home", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let jsonVaue = try JSON(data: data)
                let status = jsonVaue.dictionaryObject?["statuses"] as? [[String: Any]]
                dataSources = status!.kj.modelArray(type: StatusModel.self) as? Array<StatusModel>

            } catch  {
                print("读取home.json失败",error)
            }
        }
        
    }
    override func setupNaviTitle() {
        let title = "小磊小窝"
        let buttton = MFTitleButton(title: title, target: self, action: #selector(clickTitleButton(btn:)))
        naviItem.titleView = buttton
    }
    
    @objc func clickTitleButton(btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
    
    @objc func showFridends(){
        
    }
}


extension HomeViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = dataSources?.count {
            return count
        }
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let status = dataSources?[indexPath.row] else { return UITableViewCell() }
        var cell: HomeBaseCell? = tableView.dequeueReusableCell(withIdentifier: cellID) as? HomeBaseCell
        if cell == nil {
            cell = HomeBaseCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellID)
        }
        cell?.nameLabel.text = status.user?.screen_name
        guard let str = status.user?.profile_image_url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return UITableViewCell() }
        cell?.avatarImage.kf.setImage(with: URL(string:str ))
        return cell ?? UITableViewCell()
    }
    
}

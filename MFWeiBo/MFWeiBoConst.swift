//
//  MFWeiBoConst.swift
//  MFWeiBo
//
//  Created by 田明甫 on 2020/6/17.
//  Copyright © 2020 tianmingfu. All rights reserved.
//

import Foundation

// MARK: - App infomation
let MFAppKey = "2506699367"

let MFAppSecret = "ba19284c926ff2b78caa59a4369ce6e9"
// 登录完成-跳转的地址
let MFredirectUri = "https://api.weibo.com/oauth2/default.html"

//MARK: - global notification

let MFUserShouldLoginNotification = "MFUserShouldLoginNotification"

let MFUserLoginSuccessNotification = "MFUserLoginSuccessNotification"

/// 微博Cell浏览照片
/// @param urlString   urlString 字符串
/// @param photoIndex  照片索引
/// @param placeholder 占位图像
let MFWeiboCellBrowserPhotoNotification = "MFWeiboCellBrowserPhotoNotification"

let MFWeiboCellBrowserPhotoIndexKey = "MFWeiboCellBrowserPhotoIndexKey"
let MFWeiboCellBrowserPhotoURLsKeys = "MFWeiboCellBrowserPhotoURLsKeys"
let MFWeiboCellBrowserPhotoImageViewsKeys = "MFWeiboCellBrowserPhotoImageViewsKeys"

//MARK: - 微博配图视图常亮
//let MFDefaultMargin = MFLayout.Layout(12)
//外部间距
//let MFStatusPictureOutterMargin = MFLayout.Layout(12)
//内部间距
//let MFStatusPictureInnerMargin = MFLayout.Layout(5)

let MFPictureMaxPerLine:CGFloat = 3

//1.calculate width
//let MFPictureViewWidth = UIScreen.MF_screenW - (2 * MFStatusPictureOutterMargin)

//let MFPictureItemWidth = (MFPictureViewWidth - (2 * MFStatusPictureInnerMargin)) / MFPictureMaxPerLine

// iPhone X
let MF_iPhoneX = (UIScreen.mf_ScreenWidth >= 375 && UIScreen.mf_ScreenHeight >= 812)

// Status bar height.
let MF_statusBarHeight:CGFloat = MF_iPhoneX ? 44 : 20

let MF_naviContentHeight:CGFloat = 44

let MF_bottomTabBarContentHeigth:CGFloat = 49

let MF_bottomTabBarSpeacing:CGFloat = MF_iPhoneX ? 34 : 0

// Tabbar height.
let MF_bottomTabBarHeight:CGFloat  =  MF_iPhoneX ? (MF_bottomTabBarContentHeigth + MF_bottomTabBarSpeacing) : MF_bottomTabBarContentHeigth

// Status bar & navigation bar height.
var MF_naviBarHeight:CGFloat = MF_statusBarHeight + MF_naviContentHeight



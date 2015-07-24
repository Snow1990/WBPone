//
//  HomeViewController.swift
//  WBPone
//
//  Created by SN on 15/7/24.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTabBar()
//        let bu = AmazingButton()
//        let a = AmaButtonTypeFodder
//        let button = AmazingButton(frame: CGRectMake(100, 100, 100, 100), color: UIColor.redColor(), type: AmaButtonTypeUser)
        
//        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - TabBar初始化
    func initTabBar() {
        
        //tabBarItem的image属性必须是png格式（建议大小32*32）并且打开alpha通道否则无法正常显示。
        self.navigationController?.tabBarItem.title = "首页"
        self.navigationController?.tabBarItem.image = UIImage(named: "tab_icon1_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "tab_icon1_pressed")
    }

}


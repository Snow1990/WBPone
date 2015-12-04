//
//  HomeViewController.swift
//  WBPone
//
//  Created by SN on 15/7/24.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let ToLoginViewSegue = "ToLoginViewSegue"
    let ToDiandangSegue = "ToDiandangSegue"
    let ToShudangSegue = "ToShudangSegue"
    let ToXudangSegue = "ToXudangSegue"
    let ToJuedangSegue = "ToJuedangSegue"
    
    var diandangBtn = DKCircleButton()
    var shudangBtn = DKCircleButton()
    var xudangBtn = DKCircleButton()
    var juedangBtn = DKCircleButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTabBar()

        setupUIElements()
        
        resetContentFrame()
    }
    
    func setupUIElements() {

        diandangBtn.titleLabel?.font = UIFont.systemFontOfSize(24)
        diandangBtn.setTitle("典当", forState: UIControlState.Normal)
        diandangBtn.addTarget(self, action: "diandangClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(diandangBtn)
        
        shudangBtn.titleLabel?.font = UIFont.systemFontOfSize(24)
        shudangBtn.setTitle("赎当", forState: UIControlState.Normal)
        shudangBtn.addTarget(self, action: "shudangClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(shudangBtn)
        
        xudangBtn.titleLabel?.font = UIFont.systemFontOfSize(24)
        xudangBtn.setTitle("利息", forState: UIControlState.Normal)
        xudangBtn.addTarget(self, action: "xudangClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(xudangBtn)
        
        juedangBtn.titleLabel?.font = UIFont.systemFontOfSize(24)
        juedangBtn.setTitle("绝当", forState: UIControlState.Normal)
        juedangBtn.addTarget(self, action: "juedangClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(juedangBtn)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        let rect = UIScreen.mainScreen().bounds
        let radius:CGFloat = 60
        let distance = rect.width/4
        
        diandangBtn.frame = CGRectMake(
            rect.width/2 - distance - radius,
            rect.height/2 - distance - radius,
            2 * radius,
            2 * radius)
        shudangBtn.frame = CGRectMake(
            rect.width/2 + distance - radius,
            rect.height/2 - distance - radius,
            2 * radius,
            2 * radius)
        xudangBtn.frame = CGRectMake(
            rect.width/2 - distance - radius,
            rect.height/2 + distance - radius,
            2 * radius,
            2 * radius)
        juedangBtn.frame = CGRectMake(
            rect.width/2 + distance - radius,
            rect.height/2 + distance - radius,
            2 * radius,
            2 * radius)
        
        
    }

    
    func diandangClicked() {
        self.performSegueWithIdentifier(ToDiandangSegue, sender: nil)
    }
    func shudangClicked() {
        self.performSegueWithIdentifier(ToShudangSegue, sender: nil)
    }
    func xudangClicked() {
        self.performSegueWithIdentifier(ToXudangSegue, sender: nil)
    }
    func juedangClicked() {
        self.performSegueWithIdentifier(ToJuedangSegue, sender: nil)
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


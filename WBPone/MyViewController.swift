//
//  MyViewController.swift
//  WBPone
//
//  Created by SN on 15/7/24.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBAction func LogoffClick(sender: UIButton) {
        self.navigationController?.tabBarController?.dismissViewControllerAnimated(true, completion: nil)
//        self.dismissViewControllerAnimated(true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - TabBar初始化
    func initTabBar() {
        
        //tabBarItem的image属性必须是png格式（建议大小32*32）并且打开alpha通道否则无法正常显示。
        self.navigationController?.tabBarItem.title = "我的"
        self.navigationController?.tabBarItem.image = UIImage(named: "tab_icon3_normal")
        self.navigationController?.tabBarItem.selectedImage = UIImage(named: "tab_icon3_pressed")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

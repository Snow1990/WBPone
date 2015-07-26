//
//  MyViewController.swift
//  WBPone
//
//  Created by SN on 15/7/24.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, AccountDelegate {

    @IBAction func LogoffClick(sender: UIButton) {
        PFUser.logOut()
        self.navigationController?.tabBarController?.dismissViewControllerAnimated(true, completion: nil)

    }
    // MARK:- Properties
    let ToAddMoneySegue = "ToAddMoneySegue"
    // MARK:- UI Elements
    var userNameView = LabelLabelView()
    var userAccountView = LabelLabelBtnView()
    // MARK:- Init

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTabBar()
        setupUIElements()
        resetContentFrame()
    }
    override func viewDidAppear(animated: Bool) {
        userAccountView.value = UserInfo.currentUser()!["account"] as? Double
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
    
    
    func setupUIElements() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "我的账户"
        
        userNameView.key = "用户名："
        userNameView.value = UserInfo.currentUser()!.username
        self.view.addSubview(userNameView)
        
        userAccountView.key = "账户余额："
        userAccountView.value = UserInfo.currentUser()!["account"] as? Double
        userAccountView.delegate = self
        self.view.addSubview(userAccountView)
        
        
        
        
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        
        userNameView.frame = CGRectMake(
            0,
            100,
            Constants.Rect.width,
            35)
        
        userAccountView.frame = CGRectMake(
            0,
            135,
            Constants.Rect.width,
            35)
        
        
    }
    // Account Delegate
    func addBtnClick() {
        self.performSegueWithIdentifier(ToAddMoneySegue, sender: nil)
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

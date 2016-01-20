//
//  SearchDealIdViewController.swift
//  WBPone
//
//  Created by SN on 15/7/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SearchDealIdViewController: UIViewController{
    
    // MARK:- Properties
    let keys = ["凭证序号","姓名","身份证号","联系电话","抵押日期"]
    let ToSearchResultSegue = "ToSearchResultSegue"
//    var currentQuery: PFQuery?

    // MARK:- UI Elements
    var rootView = TPKeyboardAvoidingScrollView()
    var keyValueViewArr = [LabelTFView]()
    var doneBtn = UIButton(type: UIButtonType.System)

    // MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        resetContentFrame()
    }
    
    func setupUIElements() {
        self.rootView.frame = self.view.frame
        self.rootView.backgroundColor = Constants.backgroundColor
        self.view.addSubview(rootView)
        
        for key in keys {
            let keyValueView = LabelTFView()
            keyValueView.key = key + ":"
            self.keyValueViewArr.append(keyValueView)
            self.rootView.addSubview(keyValueView)
        }
        
        doneBtn.setTitle("查询", forState: UIControlState.Normal)
        doneBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        doneBtn.backgroundColor = UIColor.orangeColor()
        doneBtn.addTarget(self, action: "doneClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.rootView.addSubview(doneBtn)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        for (index,keyValueView) in keyValueViewArr.enumerate() {
            keyValueView.frame = CGRectMake(
                0,
                0 + 35 * CGFloat(index),
                Constants.Rect.width,
                35)
        }
        let lastView = keyValueViewArr[keys.count - 1]
        doneBtn.frame  = CGRectMake(
            360 * Constants.Scale,
            lastView.frame.maxY + 10,
            350 * Constants.Scale,
            44)
    }
    // 点击完成按钮
    func doneClick() {
        self.performSegueWithIdentifier(ToSearchResultSegue, sender: nil)
    }
    
   
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //判断是否是搜索结果界面
        if let dest = segue.destinationViewController as? SearchResultTableViewController {
            dest.dealId = keyValueViewArr[0].value
            dest.name = keyValueViewArr[1].value
            dest.cardNo = keyValueViewArr[2].value
            dest.telephone = keyValueViewArr[3].value
            dest.poneDate = keyValueViewArr[4].value
        }
    }
    
    
}

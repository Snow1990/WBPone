//
//  SearchDealIdViewController.swift
//  WBPone
//
//  Created by SN on 15/7/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SearchDealIdViewController: UIViewController, UITextFieldDelegate {
    
    // MARK:- Properties
    let keys = ["凭证序号","姓名","身份证号","联系电话"]
    let ToSearchResultSegue = "ToSearchResultSegue"
    var currentQuery: PFQuery?

    // MARK:- UI Elements
    var keyValueViewArr = [LabelTFView]()
    var doneBtn = UIButton.buttonWithType(UIButtonType.System) as! UIButton

    // MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        resetContentFrame()
    }
    
    func setupUIElements() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        for key in keys {
            let keyValueView = LabelTFView()
            keyValueView.key = key + ":"
            keyValueView.valueTextField.delegate = self
            self.keyValueViewArr.append(keyValueView)
            self.view.addSubview(keyValueView)
        }
        
        doneBtn.setTitle("查询", forState: UIControlState.Normal)
        doneBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        doneBtn.backgroundColor = UIColor.orangeColor()
        doneBtn.addTarget(self, action: "doneClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(doneBtn)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        for (index,keyValueView) in enumerate(keyValueViewArr) {
            keyValueView.frame = CGRectMake(
                0,
                100 + 35 * CGFloat(index),
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
    
    // MARK: Text Field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //判断是否是课程界面
        if let dest = segue.destinationViewController as? SearchResultTableViewController {
            dest.dealId = keyValueViewArr[0].value
            dest.name = keyValueViewArr[1].value
            dest.cardNo = keyValueViewArr[2].value
            dest.telephone = keyValueViewArr[3].value
        }
    }
    
    
}

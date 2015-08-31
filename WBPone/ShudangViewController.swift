//
//  ShudangViewController.swift
//  WBPone
//
//  Created by SN on 15/7/27.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class ShudangViewController: UIViewController {
    
    // MARK:- Properties
    let keys = ["凭证编号","赎当金额"]
    var dealId: Int?

    // MARK:- UI Elements
    var rootView = TPKeyboardAvoidingScrollView()
    var keyValueViewArr = [LabelTFView]()
    var doneBtn = UIButton.buttonWithType(UIButtonType.System) as! UIButton

    // MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        resetContentFrame()
        if let dealId = dealId {
            keyValueViewArr[0].value = toString(dealId)
        }
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
    
        doneBtn.setTitle("确定", forState: UIControlState.Normal)
        doneBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        doneBtn.backgroundColor = UIColor.orangeColor()
        doneBtn.addTarget(self, action: "doneClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.rootView.addSubview(doneBtn)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        for (index,keyValueView) in enumerate(keyValueViewArr) {
            keyValueView.frame = CGRectMake(
                0,
                35 * CGFloat(index),
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
        
        if keyValueViewArr[0].value == nil
            || keyValueViewArr[1].value == nil {
                return
        }
        if keyValueViewArr[0].value! == ""
            || keyValueViewArr[1].value! == "" {
                self.showStringErrorView("凭证编号或赎当金额不能为空！")
                return
        }

        let dealId = NSString(string: keyValueViewArr[0].value!).integerValue
        let redemptionPrice = NSString(string: keyValueViewArr[1].value!).doubleValue

        let query = DealInfo.query()!
        query.whereKey("dealId", equalTo: dealId)
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in

            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects!.count) scores.")
                if objects!.count == 1 {
                    if let deal = objects![0] as? DealInfo {
                        
                        if deal.isDone {
                            self.showStringErrorView("此编号已经交易完成！")
                            return
                        }
                        
                        var uploadObjects = [AnyObject]()
     
                        let account = Account()
                        let user = UserInfo.currentUser()!
                        // 交易详情
                        deal.redemptionPrice = redemptionPrice
                        deal.profit = deal.profit + deal.redemptionPrice - deal.ponePrice
                        deal.isDone = true
                        
                        // 交易流水
                        let balance = user["balance"] as! Double
                        account.user = user
                        account.money = deal.redemptionPrice
                        account.balance = balance + account.money
                        account.remark = "赎回物品。"
                        
                        user["balance"] = account.balance
                        
                        uploadObjects.append(deal)
                        uploadObjects.append(user)
                        uploadObjects.append(account)
                        // 上传数据
                        PFObject.saveAllInBackground(uploadObjects) { (succeeded, error) -> Void in
                            if succeeded {
                                
                                let alert = UIAlertController(title: "Success", message: "保存成功", preferredStyle: UIAlertControllerStyle.Alert)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
                                    self.navigationController?.popToRootViewControllerAnimated(true)
                                }))
                                self.presentViewController(alert, animated: true, completion: nil)
                                
                            } else {
                                self.showErrorView(error!)
                            }
                        }
                        
                    }
                }
                
            } else {
                // Log details of the failure
                self.showErrorView(error!)
            }
        }
        

    }
    
    
}

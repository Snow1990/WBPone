//
//  DiandangViewController.swift
//  WBPone
//
//  Created by SN on 15/7/25.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class DiandangViewController: UIViewController {
    
    
    // MARK:- Properties
    let keys = ["姓名","身份证号","联系电话","当物名称","数量","价格","抵押时间(月)","每天利息","每月利息","备注"]
    
    // MARK:- UI Elements
    var rootView = TPKeyboardAvoidingScrollView()
    var dealKeyValueView = DealKeyValueView()
    var typeKeyValueView = TypeKeyValueView()
    var keyValueViewArr = [LabelTFView]()
    var doneBtn = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    // MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        resetContentFrame()
        
        getDealId()
        
    }
    
    func setupUIElements() {
        self.rootView.frame = self.view.frame
        self.rootView.backgroundColor = Constants.backgroundColor
        self.view.addSubview(rootView)
        
        self.navigationItem.title = "典当"
        
        dealKeyValueView.key = "凭证序号："
        dealKeyValueView.value = 0
        self.rootView.addSubview(dealKeyValueView)
        
        typeKeyValueView.key = "类别："
        self.rootView.addSubview(typeKeyValueView)
        
        for key in keys {
            let keyValueView = LabelTFView()
            keyValueView.key = key + ":"
//            keyValueView.valueTextField.delegate = self
            self.keyValueViewArr.append(keyValueView)
            self.rootView.addSubview(keyValueView)
        }
        
        doneBtn.setTitle("确定", forState: UIControlState.Normal)
        doneBtn.setTitle("保存中...", forState: UIControlState.Highlighted)
        doneBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        doneBtn.backgroundColor = UIColor.orangeColor()
        doneBtn.addTarget(self, action: "doneClick", forControlEvents: UIControlEvents.TouchUpInside)
        doneBtn.enabled = false
        self.rootView.addSubview(doneBtn)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        
        dealKeyValueView.frame = CGRectMake(
            0,
            0,
            Constants.Rect.width,
            35)
        typeKeyValueView.frame  = CGRectMake(
            0,
            dealKeyValueView.frame.maxY,
            Constants.Rect.width,
            35)

        for (index,keyValueView) in enumerate(keyValueViewArr) {
            keyValueView.frame = CGRectMake(
                0,
                typeKeyValueView.frame.maxY + 35 * CGFloat(index),
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

        var uploadObjects = [AnyObject]()
        
        let deal = DealInfo()
        let customer = CustomerInfo()
        let goods = GoodsInfo()
        let account = Account()
        let user = UserInfo.currentUser()!

        customer.name = keyValueViewArr[0].value
        customer.cardNo = keyValueViewArr[1].value
        customer.telephone = keyValueViewArr[2].value
        uploadObjects.append(customer)
     
        goods.type = typeKeyValueView.value
        goods.name = keyValueViewArr[3].value
        if let value = keyValueViewArr[4].value {
            goods.count = NSString(string: value).doubleValue
        }
        if let value = keyValueViewArr[5].value {
            deal.ponePrice = NSString(string: value).doubleValue

            let balance = user["balance"] as! Double
            
            account.user = user
            account.money = -deal.ponePrice
            account.balance = balance + account.money
            account.remark = "抵押。"
            user["balance"] = account.balance
            
            uploadObjects.append(user)
            uploadObjects.append(account)

        }
        if let value = keyValueViewArr[6].value {
            goods.time = NSString(string: value).doubleValue
        }
        if let value = keyValueViewArr[7].value {
            goods.interestPerDay = NSString(string: value).doubleValue
        }
        if let value = keyValueViewArr[8].value {
            goods.interestPerMonth = NSString(string: value).doubleValue
        }
        goods.remark = keyValueViewArr[9].value
        uploadObjects.append(goods)
        
        deal.dealId = dealKeyValueView.value
        deal.customer = customer
        deal.goods = goods
        deal.user = UserInfo.currentUser()!
        deal.redemptionPrice = 0
        deal.profit = 0
        deal.isDone = false
        deal.isDead = false
        uploadObjects.append(deal)

        // 上传数据
        PFObject.saveAllInBackground(uploadObjects) { (succeeded, error) -> Void in
            if succeeded {

                let alert = UIAlertController(title: "Success", message: "保存成功", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
                    self.navigationController?.popViewControllerAnimated(true)
                }))
                self.presentViewController(alert, animated: true, completion: nil)
                
            } else {
                self.showErrorView(error!)

            }
        }
    }
    
    // 获取凭证序号
    func getDealId() {
        let query = DealInfo.query()!
        query.countObjectsInBackgroundWithBlock { (count, error) -> Void in
            if error == nil {
                println("load seccess")

                self.dealKeyValueView.value = Int(count)
                self.doneBtn.enabled = true
                
            } else if let error = error {
                
                self.showErrorView(error)
            }
        }
        
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

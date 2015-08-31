//
//  DealDetailViewController.swift
//  WBPone
//
//  Created by SN on 15/7/27.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class DealDetailViewController: UIViewController {
    
    // MARK:- Properties
    let ToShudangSegue = "ToShudangSegue"
    let ToXudangSegue = "ToXudangSegue"
    let ToJuedangSegue = "ToJuedangSegue"
    let keys = ["凭证编号","抵押价格","取回价格","利润","状态","姓名","身份证号","联系电话","当物名称","类型","数量","抵押时间(月)","每天利息","每月利息","备注","抵押日期"]
    var currentDeal: DealInfo!
    var currentDealInterestArr = [InterestInfo]() {
        didSet {
            resetInterestElements()
            resetContentFrame()
        }
    }
    
    
    // MARK:- UI Elements
    var rootView = UIScrollView()
    var xudangBtn = UIButton()
    var shudangBtn = UIButton()
    var juedangBtn = UIButton()
    var keyValueViewArr = [LabelLabelView]()
    var interestViewArr = [LabelLabelView]()
    // MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInterestData()
        setupUIElements()
        resetContentFrame()

    }
    
    func toString(value: AnyObject?) -> String {
        if value == nil {
            return ""
        }
        
        if let value = value as? String {
            return value
        }
        if let value = value as? Int {
            if value == 0 {
                return ""
            }else {
                return "\(value)"
            }
        }
        if let value = value as? Double {
            if value == 0 {
                return ""
            }else {
                return "\(value)"
            }
        }
        if let value = value as? NSDate {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
            let dateString = dateFormatter.stringFromDate(value)
            
            return dateString
        }
        return ""
    }
    
    func toString(isDone: Bool, isDead: Bool) -> String {
        if isDone {
            if isDead {
                return "交易完成：已出售"
            }else {
                return "交易完成：已取回"
            }
        }else {
            return "抵押中"
        }
    }
    
    func setupUIElements() {
        self.rootView.frame = self.view.frame
        self.rootView.backgroundColor = Constants.backgroundColor
        self.view.addSubview(rootView)

        xudangBtn.setTitle("续当", forState: UIControlState.Normal)
        xudangBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        xudangBtn.backgroundColor = UIColor.orangeColor()
        xudangBtn.addTarget(self, action: "xudangClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.rootView.addSubview(xudangBtn)
        
        shudangBtn.setTitle("赎当", forState: UIControlState.Normal)
        shudangBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        shudangBtn.backgroundColor = UIColor.orangeColor()
        shudangBtn.addTarget(self, action: "shudangClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.rootView.addSubview(shudangBtn)
        
        juedangBtn.setTitle("绝当", forState: UIControlState.Normal)
        juedangBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        juedangBtn.backgroundColor = UIColor.orangeColor()
        juedangBtn.addTarget(self, action: "juedangClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.rootView.addSubview(juedangBtn)
        
        var values: [String] = [
            toString(currentDeal.dealId),
            toString(currentDeal.ponePrice),
            toString(currentDeal.redemptionPrice),
            toString(currentDeal.profit),
            toString(currentDeal.isDone, isDead: currentDeal.isDead) ,
            toString(currentDeal.customer["name"]),
            toString(currentDeal.customer["cardNo"]),
            toString(currentDeal.customer["telephone"]),
            toString(currentDeal.goods["name"]),
            toString(currentDeal.goods["type"]),
            toString(currentDeal.goods["count"]),
            toString(currentDeal.goods["time"]),
            toString(currentDeal.goods["interestPerDay"]),
            toString(currentDeal.goods["interestPerMonth"]),
            toString(currentDeal.goods["remark"]),
            toString(currentDeal.createdAt),
        ]
        
        for (index,key) in enumerate(keys) {
            let keyValueView = LabelLabelView()
            keyValueView.key = key + ":"
            keyValueView.value = values[index]
            self.keyValueViewArr.append(keyValueView)
            self.rootView.addSubview(keyValueView)
        }

    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        
        
        xudangBtn.frame = CGRectMake(
            5,
            5,
            90,
            30)
        
        shudangBtn.frame = CGRectMake(
            105,
            5,
            90,
            30)
        
        juedangBtn.frame = CGRectMake(
            205,
            5,
            90,
            30)
        
        for (index,keyValueView) in enumerate(keyValueViewArr) {
            keyValueView.frame = CGRectMake(
                0,
                xudangBtn.frame.maxY + 5 + 35 * CGFloat(index),
                Constants.Rect.width,
                35)
        }
        var lastViewFrame = keyValueViewArr[keyValueViewArr.count - 1].frame
        rootView.contentSize.height = lastViewFrame.maxY
        
        for (index,keyValueView) in enumerate(interestViewArr) {
            keyValueView.frame = CGRectMake(
                0,
                lastViewFrame.maxY + 35 * CGFloat(index),
                Constants.Rect.width,
                35)
        }
        if !interestViewArr.isEmpty {
            lastViewFrame = interestViewArr[interestViewArr.count - 1].frame
            rootView.contentSize.height = lastViewFrame.maxY
        }
        
    }
    
    func getInterestData() {
        
        let query = InterestInfo.query()!
        
        query.whereKey("deal", equalTo: currentDeal)
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects!.count) InterestInfo.")
                if let interestInfoArr = objects as? [InterestInfo] {
                    self.currentDealInterestArr = interestInfoArr
                }
            }else {
                // Log details of the failure
                self.showErrorView(error!)
            }
        }
        
        
    }
    
    func resetInterestElements() {
        interestViewArr = []
        if currentDealInterestArr.isEmpty {
            let interestView = LabelLabelView()
            interestView.key = "无利息"

            self.interestViewArr.append(interestView)
            self.rootView.addSubview(interestView)
            return
        }
        for interest in currentDealInterestArr {

            let interestView = LabelLabelView()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy年MM月dd日"
            let dateString = dateFormatter.stringFromDate(interest.createdAt!)
            interestView.key = "\(interest.money)"
            interestView.value = dateString
            self.interestViewArr.append(interestView)
            self.rootView.addSubview(interestView)
        }
        
    }
    
    
    func shudangClick() {
        self.performSegueWithIdentifier(ToShudangSegue, sender: nil)
    }
    func xudangClick() {
        self.performSegueWithIdentifier(ToXudangSegue, sender: nil)

    }
    func juedangClick() {
        self.performSegueWithIdentifier(ToJuedangSegue, sender: nil)

    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let dest = segue.destinationViewController as? XudangViewController {
            dest.dealId = self.currentDeal.dealId
        }
        if let dest = segue.destinationViewController as? ShudangViewController {
            dest.dealId = self.currentDeal.dealId
        }
        if let dest = segue.destinationViewController as? JuedangViewController {
            dest.dealId = self.currentDeal.dealId
        }
    }
    
    
}

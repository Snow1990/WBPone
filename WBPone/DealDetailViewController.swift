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
    let keys = ["凭证编号","姓名","身份证号","联系电话","当物名称","类型","数量","价格","抵押时间","每天利息","每月利息","备注","抵押日期"]
    var currentDeal: DealInfo!
    // MARK:- UI Elements
    var keyValueViewArr = [LabelLabelView]()

    // MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        resetContentFrame()
//        println(currentDeal.dealId)
    }
    func toString(value: AnyObject?) -> String {
        if value == nil {
            return ""
        }
        
        if value is String {
            return value as! String
        }
        
        if value is Int {
            return "\(value as! Int)"
        }
        
        if value is Double {
            return "\(value as! Double)"
        }
        
        if value is NSDate {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
            let dateString = dateFormatter.stringFromDate(value as! NSDate)
            
            return dateString
        }
        
        
        return ""
    }
    func setupUIElements() {
        self.view.backgroundColor = UIColor.whiteColor()
        var values: [String] = [
            toString(currentDeal.dealId),
            toString(currentDeal.customer["name"]),
            toString(currentDeal.customer["cardNo"]),
            toString(currentDeal.customer["telephone"]),
            toString(currentDeal.goods["name"]),
            toString(currentDeal.goods["type"]),
            toString(currentDeal.goods["count"]),
            toString(currentDeal.goods["price"]),
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
            self.view.addSubview(keyValueView)
        }

    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        
        for (index,keyValueView) in enumerate(keyValueViewArr) {
            keyValueView.frame = CGRectMake(
                0,
                70 + 35 * CGFloat(index),
                Constants.Rect.width,
                35)
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

//
//  TimeKeyValueView.swift
//  WBPone
//
//  Created by SN on 15/7/28.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class TimeKeyValueView: UIView, ZHPickViewDelegate {
    
    // MARK:- Properties
    override var frame: CGRect {
        didSet {
            self.resetContentFrame()
        }
    }
    
    var key: String? {
        didSet {
            typeKeyLabel.text = key
        }
    }
    var value: NSDate! {
        didSet {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy年MM月dd日"
            let dateString = dateFormatter.stringFromDate(value)
            typeValueBtn.setTitle(dateString, forState: UIControlState.Normal)
            
        }
    }
    
    
    // MARK:- UI Elements
    var typeKeyLabel = UILabel()
    var typeValueBtn = UIButton()
    var pickView: ZHPickView!
    
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUIElements()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUIElements() {
        self.backgroundColor = Constants.backgroundColor
        
        typeKeyLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        typeKeyLabel.textColor = UIColor.grayColor()
        self.addSubview(typeKeyLabel)
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        let dateNow = NSDate()
        let dateString = dateFormatter.stringFromDate(dateNow)
        let date = dateFormatter.dateFromString(dateString)!
        self.value = date
        typeValueBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        typeValueBtn.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        typeValueBtn.titleLabel?.textAlignment = NSTextAlignment.Right
        typeValueBtn.addTarget(self, action: "typeBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(typeValueBtn)
        

        
        pickView = ZHPickView(datePickWithDate: dateNow, datePickerMode: UIDatePickerMode.Date, isHaveNavControler: false)
        pickView.delegate = self

  
    }
    func typeBtnClick() {
        pickView.show()
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        typeKeyLabel.frame = CGRectMake(
            10,
            5,
            200 * Constants.Scale,
            30)
        typeValueBtn.frame = CGRectMake(
            210 * Constants.Scale,
            5,
            500 * Constants.Scale,
            30)
        
    }
    
    func toobarDonBtnHaveClick(pickView: ZHPickView!, resultString: String!) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        if let date = dateFormatter.dateFromString(resultString) {

            self.value = date
        }
    }

    
    
    
    
    
    
}

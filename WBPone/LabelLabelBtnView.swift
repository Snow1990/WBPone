//
//  LabelLabelBtnView.swift
//  WBPone
//
//  Created by SN on 15/7/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
protocol AccountDelegate {
    func addBtnClick()
}

class LabelLabelBtnView: UIView {
    
    // MARK:- Properties
    override var frame: CGRect {
        didSet {
            self.resetContentFrame()
        }
    }
    var delegate: AccountDelegate?
    
    var key: String? {
        didSet {
            keyLabel.text = key
        }
    }
    
    var value: Double? {
        didSet {
            if let value = value {
                valueLabel.text = NSString(format: "%.02f", value) as String
            }
        }
    }
    
    // MARK:- UI Elements
    var keyLabel = UILabel()
    var valueLabel = UILabel()
    var addBtn = UIButton.buttonWithType(UIButtonType.ContactAdd) as! UIButton
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUIElements()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUIElements() {
        self.backgroundColor = UIColor.whiteColor()
        
        keyLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        keyLabel.textColor = UIColor.grayColor()
        self.addSubview(keyLabel)
        
        valueLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        valueLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(valueLabel)
        
        addBtn.addTarget(self, action: "addMoney", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(addBtn)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        keyLabel.frame = CGRectMake(
            10,
            5,
            200 * Constants.Scale,
            30)
        valueLabel.frame = CGRectMake(
            210 * Constants.Scale,
            5,
            500 * Constants.Scale,
            30)
        addBtn.frame = CGRectMake(
            600 * Constants.Scale,
            9,
            22,
            22)
    }
    func addMoney() {
        self.delegate?.addBtnClick()
        
    }
}
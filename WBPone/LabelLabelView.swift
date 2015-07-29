//
//  LabelLabelView.swift
//  WBPone
//
//  Created by SN on 15/7/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class LabelLabelView: UIView {
    
    // MARK:- Properties
    override var frame: CGRect {
        didSet {
            self.resetContentFrame()
        }
    }
    
    var key: String? {
        didSet {
            keyLabel.text = key
        }
    }
    var value: String? {
        get {
            return valueLabel.text
        }
        set {
            valueLabel.text = newValue
        }
    }
    
    // MARK:- UI Elements
    var keyLabel = UILabel()
    var valueLabel = UILabel()
    
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
        
        keyLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        keyLabel.textColor = UIColor.grayColor()
        self.addSubview(keyLabel)
        
        valueLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        valueLabel.textAlignment = NSTextAlignment.Left
        self.addSubview(valueLabel)
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
    }
}
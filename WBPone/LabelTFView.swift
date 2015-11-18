//
//  LabelTFView.swift
//  WBPone
//
//  Created by SN on 15/7/25.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class LabelTFView: UIView {
    
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
            return valueTextField.text
        }
        set {
            valueTextField.text = newValue
        }
    }
    
    // MARK:- UI Elements
    var keyLabel = UILabel()
    var valueTextField = UITextField()
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUIElements() {
        self.backgroundColor = Constants.backgroundColor

        keyLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        keyLabel.textColor = UIColor.grayColor()
        self.addSubview(keyLabel)
        
        valueTextField.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        valueTextField.textAlignment = NSTextAlignment.Right
        valueTextField.borderStyle = UITextBorderStyle.RoundedRect
        self.addSubview(valueTextField)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        keyLabel.frame = CGRectMake(
            10,
            5,
            200 * Constants.Scale,
            30)
        valueTextField.frame = CGRectMake(
            210 * Constants.Scale,
            5,
            500 * Constants.Scale,
            30)
    }
}
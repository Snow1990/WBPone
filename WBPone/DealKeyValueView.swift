//
//  DealKeyValueView.swift
//  WBPone
//
//  Created by SN on 15/7/25.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class DealKeyValueView: UIView {
    
    // MARK:- Properties
    override var frame: CGRect {
        didSet {
            self.resetContentFrame()
        }
    }
    
    var key: String? {
        didSet {
            idKeyLabel.text = key
        }
    }
    var value: Int! {
        didSet {
            self.idValueLabel.text = "\(value)"
        }
    }

    
    // MARK:- UI Elements
    var idKeyLabel = UILabel()
    var idValueLabel = UILabel()
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
        
        idKeyLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        idKeyLabel.textColor = UIColor.grayColor()
        self.addSubview(idKeyLabel)
        
        idValueLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        idValueLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(idValueLabel)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        idKeyLabel.frame = CGRectMake(
            10,
            5,
            200 * Constants.Scale,
            30)
        idValueLabel.frame = CGRectMake(
            210 * Constants.Scale,
            5,
            500 * Constants.Scale,
            30)
    }
}

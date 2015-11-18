//
//  TypeKeyValueView.swift
//  WBPone
//
//  Created by SN on 15/7/25.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class TypeKeyValueView: UIView, ZHPickViewDelegate {
    
    // MARK:- Properties
//    let chooseArray = ["金饰","手机","电脑","貂衣","车","其他"]
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
    var value: String? {
        return typeValueBtn.titleLabel?.text
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
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUIElements() {
        self.backgroundColor = Constants.backgroundColor
        
        typeKeyLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        typeKeyLabel.textColor = UIColor.grayColor()
        self.addSubview(typeKeyLabel)
        
        typeValueBtn.setTitle("金饰", forState: UIControlState.Normal)
        typeValueBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        typeValueBtn.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        typeValueBtn.titleLabel?.textAlignment = NSTextAlignment.Right
        typeValueBtn.addTarget(self, action: "typeBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(typeValueBtn)
        
        pickView = ZHPickView(pickviewWithArray: Constants.ChooseArray, isHaveNavControler: false)
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
        typeValueBtn.setTitle(resultString, forState: UIControlState.Normal)
    }
    

   
    
    
    
}

//
//  SearchAccountResultTableViewCell.swift
//  WBPone
//
//  Created by SN on 15/7/29.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SearchAccountResultTableViewCell: PFTableViewCell {
    
    // MARK:- Properties
    var remark: String? {
        didSet {
            self.remarkLabel.text = remark
        }
    }
    var changeMoney: Double = 0 {
        didSet {
            if changeMoney > 0 {
                self.changeMoneyLabel.text = "变动:+ \(changeMoney)"

            }else {
                self.changeMoneyLabel.text = "变动:\(changeMoney)"
            }
        }
    }
    var blance: Double = 0 {
        didSet {
            self.balanceLabel.text = "余额:\(blance)"
            
        }
    }
    var createdBy: NSDate? {
        didSet {
            if let createdBy = createdBy {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
                let dateString = dateFormatter.stringFromDate(createdBy)
                self.createdByLabel.text = "日期:" + dateString
            }
        }
    }
    // MARK:- UI Elements

    var remarkLabel = UILabel()
    var createdByLabel = UILabel()
    var changeMoneyLabel = UILabel()
    var balanceLabel = UILabel()
    private var separateView: UIImageView  = UIImageView()
    
    // MARK:- Init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUIElements()
        resetContentFrame()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func reuseIdentifier() -> String{
        return "SearchAccountResultTableViewCell"
    }
    
    class func getCellHeight() -> CGFloat {
        return 155 * Constants.Scale
    }
    
    func setupUIElements() {
        self.backgroundColor = Constants.backgroundColor
        
        self.remarkLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(remarkLabel)
        
        self.createdByLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(createdByLabel)
        
        self.changeMoneyLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(changeMoneyLabel)
        
        self.balanceLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(balanceLabel)
        
        self.separateView.image = UIImage(named: "separate")
        self.addSubview(separateView)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        remarkLabel.frame = CGRectMake(
            28 * Constants.Scale,
            24 * Constants.Scale,
            692 * Constants.Scale,
            28 * Constants.Scale)
//        dealIdLabel.frame = CGRectMake(
//            388 * Constants.Scale,
//            24 * Constants.Scale,
//            304 * Constants.Scale,
//            24 * Constants.Scale)
        createdByLabel.frame = CGRectMake(
            28 * Constants.Scale,
            66 * Constants.Scale,
            660 * Constants.Scale,
            24 * Constants.Scale)
        changeMoneyLabel.frame = CGRectMake(
            28 * Constants.Scale,
            103 * Constants.Scale,
            304 * Constants.Scale,
            24 * Constants.Scale)
        balanceLabel.frame = CGRectMake(
            388 * Constants.Scale,
            103 * Constants.Scale,
            304 * Constants.Scale,
            24 * Constants.Scale)
        separateView.frame = CGRectMake(
            0,
            155 * Constants.Scale - 2,
            Constants.Rect.width,
            2)
    }
}
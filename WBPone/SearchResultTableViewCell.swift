//
//  SearchResultTableViewCell.swift
//  WBPone
//
//  Created by SN on 15/7/27.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit


class SearchResultTableViewCell: PFTableViewCell {
    
    // MARK:- Properties
    var dealId: Int = 0 {
        didSet {
            self.dealIdLabel.text = "凭证Id：" + "\(dealId)"
        }
    }
    var goodsName: String? {
        didSet {
            if let goodsName = goodsName {
                self.goodsNameLabel.text = "物品名称：" + goodsName
            }
        }
    }
    var goodsPrice: Double = 0 {
        didSet {
            self.goodsPriceLabel.text = "物品价格：" + "\(goodsPrice)"

        }
    }
    var createdBy: NSDate? {
        didSet {
            if let createdBy = createdBy {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
                let dateString = dateFormatter.stringFromDate(createdBy)
                self.createdByLabel.text = "抵押时间：" + dateString
            }
        }
    }
    
    // MARK:- UI Elements
    var dealIdLabel = UILabel()
    var goodsNameLabel = UILabel()
    var goodsPriceLabel = UILabel()
    var createdByLabel = UILabel()
    private var separateView: UIView  = UIView()


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
        return "SearchResultTableViewCell"
    }
    class func getSize() -> CGSize {
        return CGSizeMake(
            720 * Constants.Scale,
            155 * Constants.Scale)
    }

    func setupUIElements() {
        self.backgroundColor = UIColor.whiteColor()
        
        self.dealIdLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(dealIdLabel)
        
        self.goodsNameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(goodsNameLabel)
        
        self.goodsPriceLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(goodsPriceLabel)
        
        self.createdByLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(createdByLabel)
        
        self.separateView.backgroundColor = UIColor.grayColor()
        self.addSubview(separateView)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        
        goodsNameLabel.frame = CGRectMake(
            28 * Constants.Scale,
            24 * Constants.Scale,
            660 * Constants.Scale,
            28 * Constants.Scale)
        createdByLabel.frame = CGRectMake(
            28 * Constants.Scale,
            66 * Constants.Scale,
            660 * Constants.Scale,
            24 * Constants.Scale)
        dealIdLabel.frame = CGRectMake(
            28 * Constants.Scale,
            103 * Constants.Scale,
            230 * Constants.Scale,
            24 * Constants.Scale)
        goodsPriceLabel.frame = CGRectMake(
            278 * Constants.Scale,
            103 * Constants.Scale,
            400 * Constants.Scale,
            24 * Constants.Scale)
        separateView.frame = CGRectMake(
            20 * Constants.Scale,
            154 * Constants.Scale,
            680 * Constants.Scale,
            0.5)
        
    }
}
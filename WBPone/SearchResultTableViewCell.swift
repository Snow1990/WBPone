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
            self.goodsPriceLabel.text = "抵押价格：" + "\(goodsPrice)"

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
    var state: (isDone: Bool, isDead: Bool)! {
        didSet {
            if state.isDone {
                if state.isDead {
                    stateLabel.text = "交易完成：已出售"

                }else {
                    stateLabel.text = "交易完成：已取回"
                }
            }else {
                stateLabel.text = "抵押中"
            }
        }
    }
    
    // MARK:- UI Elements
    var dealIdLabel = UILabel()
    var goodsNameLabel = UILabel()
    var goodsPriceLabel = UILabel()
    var createdByLabel = UILabel()
    var stateLabel = UILabel()
    private var separateView: UIImageView  = UIImageView()


    // MARK:- Init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUIElements()
        resetContentFrame()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    class func reuseIdentifier() -> String{
        return "SearchResultTableViewCell"
    }
    class func getCellHeight() -> CGFloat {
        return 155 * Constants.Scale
    }

    func setupUIElements() {
        self.backgroundColor = Constants.backgroundColor
        
        self.dealIdLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(dealIdLabel)
        
        self.goodsNameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(goodsNameLabel)
        
        self.createdByLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(createdByLabel)
        
        self.goodsPriceLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(goodsPriceLabel)
        
        self.stateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(stateLabel)
        
        self.separateView.image = UIImage(named: "separate")
        self.addSubview(separateView)
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        
        goodsNameLabel.frame = CGRectMake(
            28 * Constants.Scale,
            24 * Constants.Scale,
            304 * Constants.Scale,
            28 * Constants.Scale)
        dealIdLabel.frame = CGRectMake(
            388 * Constants.Scale,
            24 * Constants.Scale,
            304 * Constants.Scale,
            24 * Constants.Scale)
        createdByLabel.frame = CGRectMake(
            28 * Constants.Scale,
            66 * Constants.Scale,
            660 * Constants.Scale,
            24 * Constants.Scale)
        stateLabel.frame = CGRectMake(
            28 * Constants.Scale,
            103 * Constants.Scale,
            304 * Constants.Scale,
            24 * Constants.Scale)
        goodsPriceLabel.frame = CGRectMake(
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
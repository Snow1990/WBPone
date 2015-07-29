//
//  DealInfo.swift
//  WBPone
//
//  Created by SN on 15/7/23.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class DealInfo: PFObject {
    
    @NSManaged var dealId: Int
    @NSManaged var user: UserInfo!
    @NSManaged var customer: CustomerInfo!
    @NSManaged var goods: GoodsInfo!
    // 抵押价格
    @NSManaged var ponePrice: Double
    // 赎回价格
    @NSManaged var redemptionPrice: Double
    // 利润
    @NSManaged var profit: Double
    // 交易完成
    @NSManaged var isDone: Bool
    // 绝当
    @NSManaged var isDead: Bool
    
    override init() {
        super.init()
    }

    override class func query() -> PFQuery? {
        //1
        let query = PFQuery(className: DealInfo.parseClassName())
        //2
        query.includeKey("user")
        query.includeKey("customer")
        query.includeKey("goods")
        //3
        query.orderByDescending("createdAt")
        
        return query
    }
    
}

extension DealInfo: PFSubclassing {
    
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "DealInfo"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}
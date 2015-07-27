//
//  Account.swift
//  WBPone
//
//  Created by SN on 15/7/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class Account: PFObject {
    // 余额
    @NSManaged var balance: Double
    // 交易额
    @NSManaged var money: Double
    // 交易信息
    @NSManaged var remark: String?
    
    
    override init() {
        super.init()
    }
    
    override class func query() -> PFQuery? {

        let query = PFQuery(className: Account.parseClassName())
       
        query.orderByDescending("createdAt")
        
        return query
    }
    
}

extension Account: PFSubclassing {
    
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "Account"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}
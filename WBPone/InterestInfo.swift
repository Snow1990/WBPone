//
//  InterestInfo.swift
//  WBPone
//
//  Created by SN on 15/7/24.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class InterestInfo: PFObject {

    @NSManaged var deal: DealInfo!
    @NSManaged var user: UserInfo!
    @NSManaged var money: Double

    override init() {
        super.init()
    }
    
    override class func query() -> PFQuery? {
        
        let query = PFQuery(className: InterestInfo.parseClassName())
        
        query.orderByDescending("createdAt")
        
        return query
    }
    
    
}
extension InterestInfo: PFSubclassing {
    
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "InterestInfo"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}
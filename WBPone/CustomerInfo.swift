//
//  CustomerInfo.swift
//  WBPone
//
//  Created by SN on 15/7/23.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class CustomerInfo: PFObject {
//    @NSManaged var id: String!
    @NSManaged var name: String?
    @NSManaged var cardNo: String?
    @NSManaged var telephone: String?
    
    override init() {
        super.init()
    }
//    init(id: String) {
//        super.init()
//        self.id = id
//    }
    
   
}

extension CustomerInfo: PFSubclassing {
    
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "CustomerInfo"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}
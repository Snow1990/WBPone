//
//  UserInfo.swift
//  WBPone
//
//  Created by SN on 15/7/23.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class UserInfo: PFUser{

    @NSManaged var balance: Double
    
    override init() {
        super.init()
    }
}

extension UserInfo: PFSubclassing {

    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}
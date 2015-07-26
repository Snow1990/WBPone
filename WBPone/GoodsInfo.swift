//
//  GoodsInfo.swift
//  WBPone
//
//  Created by SN on 15/7/23.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class GoodsInfo: PFObject {
//    @NSManaged var id: String!
    @NSManaged var name: String?
    @NSManaged var type: String?
    @NSManaged var count: Double
    @NSManaged var price: Double
    
    // 每天利息
    @NSManaged var interestPerDay: Double
    // 每月利息
    @NSManaged var interestPerMonth: Double
    // 抵押时间
    @NSManaged var time: Double
    @NSManaged var remark: String?
    
    override init() {
        super.init()
    }
//    init(id: String) {
//        super.init()
//        self.id = id
//    }
    
}
extension GoodsInfo: PFSubclassing {
    
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "GoodsInfo"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}
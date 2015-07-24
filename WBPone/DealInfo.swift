//
//  DealInfo.swift
//  WBPone
//
//  Created by SN on 15/7/23.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class DealInfo {
    var id: String!
    
    var user: UserInfo!
    var customer: CustomerInfo!
    var goods: GoodsInfo!
    
    var interest = [InterestInfo]()
    var isDone = false
    var idDead = false
    
}
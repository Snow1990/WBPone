//
//  SearchResultTableViewController.swift
//  WBPone
//
//  Created by SN on 15/7/27.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit


class SearchResultTableViewController: PFQueryTableViewController {
    
    
    let ToDealDetailSegue = "ToDealDetailSegue"
    var selectDeal: DealInfo?
    
    // 查询条件
    var dealId: String?
    var name: String?
    var cardNo: String?
    var telephone: String?
    var isDone: Bool?
    var isOutOfTime: Bool?
    var goodsType: String?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadObjects()

        self.tableView.backgroundColor = Constants.backgroundColor
        self.tableView.registerClass(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.reuseIdentifier())

    }
    
    override func queryForTable() -> PFQuery {
        
        var innerQuery = CustomerInfo.query()!
        if let name = name {
            if name != "" {
                innerQuery.whereKey("name", equalTo: name)
            }
        }
        if let cardNo = cardNo {
            if cardNo != "" {
                innerQuery.whereKey("cardNo", equalTo: cardNo)
            }
        }
        if let telephone = telephone {
            if telephone != "" {
                innerQuery.whereKey("telephone", equalTo: telephone)
            }
        }
        
        var innerGoodsQuery = GoodsInfo.query()!
        if let goodsType = goodsType {
            if goodsType != "" {
                innerGoodsQuery.whereKey("type", equalTo: goodsType)
            }
        }
        
        let query = DealInfo.query()!
        query.whereKey("customer", matchesQuery: innerQuery)
        query.whereKey("goods", matchesQuery: innerGoodsQuery)
        
        if let dealId = dealId {
            if dealId != "" {
                query.whereKey("dealId", equalTo: NSString(string: dealId).integerValue)
            }
        }
        if let isDone = isDone {
            query.whereKey("isDone", equalTo: isDone)
        }
        if let isOutOfTime = isOutOfTime {
            if isOutOfTime {
                let dateNow = NSDate()
                let secondsPerMonth: NSTimeInterval = 30*24*60*60
                var lastMonthDate = dateNow.dateByAddingTimeInterval(-secondsPerMonth)
                query.whereKey("updatedAt", lessThanOrEqualTo: lastMonthDate)
            }
        }
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {

        let cell = tableView.dequeueReusableCellWithIdentifier(SearchResultTableViewCell.reuseIdentifier(), forIndexPath: indexPath) as! SearchResultTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        let deal = object as! DealInfo
        cell.dealId = deal.dealId
        cell.goodsPrice = deal.ponePrice
        cell.state = (deal.isDone, deal.isDead)
        cell.createdBy = deal.createdAt
        if let goods = deal.goods {
            cell.goodsName = goods["name"] as? String
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectDeal = self.objectAtIndexPath(indexPath) as? DealInfo
        self.performSegueWithIdentifier(ToDealDetailSegue, sender: nil)

    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SearchResultTableViewCell.getCellHeight()
    }
    
    // 滚动到底部自动加载下一页
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentSize.height > 0
            && scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
                loadNextPage()
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //判断是否是课程界面
        if let dest = segue.destinationViewController as? DealDetailViewController {
            dest.currentDeal = selectDeal!
        }
    }

}

//
//  SearchAccountResultTablViewController.swift
//  WBPone
//
//  Created by SN on 15/7/28.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SearchAccountResultTablViewController: PFQueryTableViewController {

    // 查询条件
    var startDate: NSDate?
    var endDate: NSDate?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadObjects()
        
        self.tableView.backgroundColor = Constants.backgroundColor
        self.tableView.registerClass(SearchAccountResultTableViewCell.self, forCellReuseIdentifier: SearchAccountResultTableViewCell.reuseIdentifier())
        
    }
    
    override func queryForTable() -> PFQuery {
        
        let query = Account.query()!
        if let startDate = startDate,
            let endDate = endDate {
                query.whereKey("createdAt", greaterThanOrEqualTo: startDate)
                let secondsPerDay: NSTimeInterval = 24*60*60
                var nextEndDate = endDate.dateByAddingTimeInterval(secondsPerDay)
                query.whereKey("createdAt", lessThanOrEqualTo: nextEndDate)
        }
        
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(SearchAccountResultTableViewCell.reuseIdentifier(), forIndexPath: indexPath) as! SearchAccountResultTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        let account = object as! Account
        cell.remark = account.remark
        cell.changeMoney = account.money
        cell.blance = account.balance
        cell.createdBy = account.createdAt
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SearchAccountResultTableViewCell.getCellHeight()
    }

    // 滚动到底部自动加载下一页
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentSize.height > 0
            && scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
                loadNextPage()
        }
    }
    
    
    
    

}

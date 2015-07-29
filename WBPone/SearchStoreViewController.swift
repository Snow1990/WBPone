//
//  SearchStoreViewController.swift
//  WBPone
//
//  Created by SN on 15/7/29.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SearchStoreViewController: UIViewController {
    
    // MARK:- Properties
    
    // MARK:- UI Elements
    
    // MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        resetContentFrame()
    }
    
    func setupUIElements() {
        self.view.backgroundColor = Constants.backgroundColor
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let button = sender as? UIButton,
            let text = button.titleLabel?.text {
                if text == "全部库存" {
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {

                        dest.isDone = false
                    }
                }else if text == "逾期库存" {
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
                        dest.isDone = false
                        dest.isOutOfTime = true
                    }
                }

        }
    
    
    }

    
}

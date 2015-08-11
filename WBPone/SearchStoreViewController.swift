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
        let ChooseArray = ["金饰","手机","电脑","貂衣","车","其他"]

        if let button = sender as? UIButton,
            let text = button.titleLabel?.text {
                switch text {
                case "金饰库存" :
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
                        dest.goodsType = ChooseArray[0]
                        dest.isDone = false
                    }
                case "手机库存" :
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
                        dest.goodsType = ChooseArray[1]
                        dest.isDone = false
                    }
                case "电脑库存" :
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
                        dest.goodsType = ChooseArray[2]
                        dest.isDone = false
                    }
                case "貂衣库存" :
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
                        dest.goodsType = ChooseArray[3]
                        dest.isDone = false
                    }
                case "车辆库存" :
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
                        dest.goodsType = ChooseArray[4]
                        dest.isDone = false
                    }
                case "其他库存" :
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
                        dest.goodsType = ChooseArray[5]
                        dest.isDone = false
                    }
                case "逾期库存" :
                    //判断是否是搜索结果界面
                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
                        dest.isDone = false
                        dest.isOutOfTime = true
                    }
                    
                default:
                    return
                }
                
//                if text == "全部库存" {
//                    //判断是否是搜索结果界面
//                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
//
//                        dest.isDone = false
//                    }
//                }else if text == "逾期库存" {
//                    //判断是否是搜索结果界面
//                    if let dest = segue.destinationViewController as? SearchResultTableViewController {
//                        dest.isDone = false
//                        dest.isOutOfTime = true
//                    }
//                }

        }
    
    
    }

    
}

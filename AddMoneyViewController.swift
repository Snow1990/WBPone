//
//  AddMoneyViewController.swift
//  WBPone
//
//  Created by SN on 15/7/26.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class AddMoneyViewController: UIViewController {
    
    // MARK:- Properties
    
    // MARK:- UI Elements
    @IBOutlet weak var moneyTF: UITextField!
    @IBOutlet weak var remarkTF: UITextField!
    
    @IBAction func doneBtnClick(sender: UIButton) {
        let account = Account()
        let user = UserInfo.currentUser()!
        
        account.money = NSString(string: moneyTF.text).doubleValue
        let balance = user["balance"] as! Double
        account.balance = balance + account.money
        account.remark = remarkTF.text
        
        user["balance"] = account.balance
        
        let uploadObjects = [user, account]
        PFObject.saveAllInBackground(uploadObjects) { (succeeded, error) -> Void in
            if succeeded {
                println("Objects Uploaded")
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                println("Error: \(error) \(error!.userInfo!)")
            }
        }
          
    }
    // MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        resetContentFrame()
    }
    
    func setupUIElements() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    // MARK: Update Frame
    func resetContentFrame() {
        
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

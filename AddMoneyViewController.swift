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
        
        account.user = user
        account.money = NSString(string: moneyTF.text).doubleValue
        let balance = user["balance"] as! Double
        account.balance = balance + account.money
        account.remark = remarkTF.text
        
        user["balance"] = account.balance
        
        let uploadObjects = [user, account]
        PFObject.saveAllInBackground(uploadObjects) { (succeeded, error) -> Void in
            if succeeded {
                let alert = UIAlertController(title: "Success", message: "保存成功", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
                    self.navigationController?.popViewControllerAnimated(true)
                }))
                self.presentViewController(alert, animated: true, completion: nil)
                
            } else {
                self.showErrorView(error!)
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
        self.view.backgroundColor = Constants.backgroundColor
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

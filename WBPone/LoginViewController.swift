//
//  LoginViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let tabViewMainSegue = "LoginSuccesful"
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Check if user exists and logged in
        if let user = UserInfo.currentUser() {
            if user.isAuthenticated() {
                println("user exists and logged in")
                self.performSegueWithIdentifier(tabViewMainSegue, sender: nil)
            }
        }
    }

    // MARK: - Actions
    @IBAction func logInPressed(sender: AnyObject) {
        UserInfo.logInWithUsernameInBackground(userTextField.text, password: passwordTextField.text) { user, error in
            if user != nil {
                self.performSegueWithIdentifier(self.tabViewMainSegue, sender: nil)
                println("logIn")
            } else if let error = error {
                self.showErrorView(error)
            }
        }
    }
}

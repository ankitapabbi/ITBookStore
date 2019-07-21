//
//  SignUpViewController.swift
//  ITBookStore
//
//  Created by Sidharth Nayyar on 2019-07-21.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        var fname = self.txtFirstName.text!
        var pNumber = self.txtPhoneNumber.text!
        var pswd = self.txtPassword.text!
        var confirmpswd = self.txtConfirmPassword.text!
        var email = self.txtEmail.text!
            if let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
            {
                if let dict = NSDictionary(contentsOfFile: plist)
                {
                    if let users = dict["Users"] as? [[String:Any]]
                    {
                        for user in users {
                        
                        if pNumber.isValidMobile(){
                            
                            if email.validateEmail(){
                            
                            if ((fname == (user["userName"] as! String)) &&  (email == (user["userEmail"] as! String)) && (pswd == (user["password"] as! String)) && (confirmpswd == (user["password"] as! String))){
                               
                                self.performSegue(withIdentifier: "toLogin", sender: nil)
                            }
                            }else {
                                let alert = UIAlertController(title: "Error", message: "Invalid Email", preferredStyle: UIAlertController.Style.alert)
                                
                                                        let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                                                        let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                                                        alert.addAction(actionOk)
                                                        alert.addAction(actionCanel)
                                                        self .present(alert, animated: true ,completion: nil)
                                
                            }
                        }else{
                            let alert = UIAlertController(title: "Error", message: "Invalid Phone Number", preferredStyle: UIAlertController.Style.alert)
                            
                            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                            let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(actionOk)
                            alert.addAction(actionCanel)
                            self .present(alert, animated: true ,completion: nil)
                            
                                }
                            }
                        }
                }
            }
        }
    }
//    var email = self.txtEmail.text!
//    var password = self.txtPassword.text!
//    let userDefault = UserDefaults.standard
//
//    if let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
//    {
//        if let dict = NSDictionary(contentsOfFile: plist)
//        {
//            if let users = dict["Users"] as? [[String:Any]]
//            {
//                for user in users
//                {
//                    if email.validateEmail(){
//
//
//
//                        if ( (email == (user["userEmail"] as! String)) && (password == (user["password"] as! String)) ){
//
//
//                            if self.switchRememberMe.isOn
//                            {
//                                userDefault.setValue(self.txtEmail.text, forKey: "userEmail")
//                                userDefault.set(self.txtPassword.text, forKey: "userPassword")
//
//
//
//                            }
//                            else
//                            {
//                                userDefault.removeObject(forKey: "userEmail")
//                                userDefault.removeObject(forKey: "userPassword")
//
//                            }
//                            self.performSegue(withIdentifier: "toTheMenu", sender: nil)
//                            loggedIn = true
//
//                        }
//
//
//                    } else {
//                        let alert = UIAlertController(title: "Error", message: "Invalid Email", preferredStyle: UIAlertController.Style.alert)
//
//                        let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//                        let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
//                        alert.addAction(actionOk)
//                        alert.addAction(actionCanel)
//                        self .present(alert, animated: true ,completion: nil)
//
//                    }
//                }
//            }
//        }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



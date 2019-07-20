//
//  ViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-10.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit
import LocalAuthentication

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
class LoginViewController: UIViewController {

   
     var loggedIn = false
    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var txtEmail: UITextField!
        {
        didSet {
            self.txtEmail.tintColor = UIColor.black
            if let image = UIImage(named: "usericon"){
            self.txtEmail.setIcon(image)
            }
        }
    }
    
    @IBOutlet weak var txtPassword: UITextField!
        {
        didSet {
            self.txtPassword.tintColor = UIColor.black
            if let image = UIImage(named: "passwordicon"){
                self.txtPassword.setIcon(image)
            }
        }
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        var email = self.txtEmail.text!
        var password = self.txtPassword.text!
        let userDefault = UserDefaults.standard
        
        if let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: plist)
            {
                if let users = dict["Users"] as? [[String:Any]]
                {
                    for user in users
                    {
                        if email.validateEmail(){
                            
                        
                        
                            if ( (email == (user["userEmail"] as! String)) && (password == (user["password"] as! String)) ){
                                
                                
                                if self.switchRememberMe.isOn
                                {
                                    userDefault.setValue(self.txtEmail.text, forKey: "userEmail")
                                    userDefault.set(self.txtPassword.text, forKey: "userPassword")
                                    
                                    
                                    
                                }
                                else
                                {
                                    userDefault.removeObject(forKey: "userEmail")
                                    userDefault.removeObject(forKey: "userPassword")
                                    
                                }
                                self.performSegue(withIdentifier: "toTheMenu", sender: nil)
                                loggedIn = true
                                
                            }
                                
                            
                        } else { 
                            let alert = UIAlertController(title: "Error", message: "Invalid Email", preferredStyle: UIAlertController.Style.alert)
                            
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
        if !loggedIn{
            
            let alert = UIAlertController(title: "Error", message: "User Email / Password Incorrect", preferredStyle: UIAlertController.Style.alert)
            
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(actionOk)
            alert.addAction(actionCanel)
            self .present(alert, animated: true ,completion: nil)
            
        }
        

    }
    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            txtEmail.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txtPassword.text = pwd
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        getRememberMeValues()
        // Do any additional setup after loading the view.
    }

    var context = LAContext()
    
    @IBAction func btnFaceId(_ sender: UIButton) {
        
        
        context.localizedCancelTitle = "Enter Username/Password"
        
        var error:NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
           
            // redirect to normal page
            
            //take back to login page
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason){ success, error in
                
                if success{
                    DispatchQueue.main.async {
                        
                        self.performSegue(withIdentifier: "toTheMenu", sender: nil)
                        self.loggedIn = true

                    }
                }else{
                    print(error?.localizedDescription ?? "Failed to authenticate")
                }
            }
        }else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
            
        }
        
    }
    //logout from screen
    
   
//ovveride function to disable keyboard on screen
        
   
    
    }


    



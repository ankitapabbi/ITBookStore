//
//  ProfileViewController.swift
//  ITBookStore
//
//  Created by Sidharth Nayyar on 2019-07-20.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserPhone: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let id = userDefault.string(forKey: "userId")
        {
            self.lblUserId.text = id
        }

        if let name = userDefault.string(forKey: "userName")
        {
            self.lblUserName.text = name
            self.title = "Hi, \(name)"
        }
        if let phone = userDefault.string(forKey: "userPhoneNumber")
        {
            self.lblUserPhone.text = phone
        }
        if let email = userDefault.string(forKey: "userEmail")
        {
            self.lblEmail.text = email
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ContactUsViewController.swift
//  ITBookStore
//
//  Created by Sidharth Nayyar on 2019-07-20.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit
import MessageUI
class ContactUsViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        }
    }
  

    
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtMsg: UITextField!
    
    @IBOutlet weak var txtEmailAdd: UITextField!
    @IBOutlet weak var txtEmailSubject: UITextField!
    @IBOutlet weak var txtEmailMsg: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact Us"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSMS(_ sender: UIButton) {
        
        let msg = self.txtMsg.text
       
            
            let send = UIContextualAction(style: .normal, title: "SMS") { (contextualAction, view,
                actionPerformed: @escaping (Bool) -> Void) in
                let alert = UIAlertController(title: "Send SMS", message: "You want to send the message : \(msg)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (alertAction) in
                    actionPerformed(false)
                }))
          
                alert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (alertAction) in
                    
                    actionPerformed(true)
                }))
            self.present(alert,animated: true)
            
//
//            let messageVC = MFMessageComposeViewController()
//
//            messageVC.body = "Hello, How are you?"
//            messageVC.recipients = ["+11234567890"]
//            messageVC.messageComposeDelegate = self
//
//            self.present(messageVC, animated: false, completion: nil)
        
//            else {
//            print("NO SIM available")
//        }
    }
    
        func btnCall(_ sender: UIButton) {
        
        if let url = URL(string: "tel://+1123777777)"), UIApplication.shared.canOpenURL(url){
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
        func btnEmail(_ sender: UIButton) {
    }
    }
    /*
     @IBAction func btnEmail(_ sender: Any) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

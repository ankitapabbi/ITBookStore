//
//  HelpViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-22.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit
import WebKit
class HelpViewController: UIViewController {

    @IBOutlet weak var helpWebKit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromFile()
        // Do any additional setup after loading the view.
    }
    func loadFromFile(){
        let localfilePath = Bundle.main.url(forResource: "Help", withExtension: "html")
        let myRequest = URLRequest(url: localfilePath!)
        helpWebKit.load(myRequest)
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

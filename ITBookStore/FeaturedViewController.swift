//
//  FeaturedViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-18.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.title = "Featured"
        readJsonFileArray(jsonFileName: "Books")
        // Do any additional setup after loading the view.
    }
    
    func readJsonFileArray(jsonFileName: String)
    {
        let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
        
        guard let jsonData = url else{
            print("Error in reading the url ")
            return
        }
        
        guard let data = try? Data(contentsOf: jsonData) else {
            print("Error in converting in data")
            return
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { // json format
            print("Error in converting in json")
            return
        }
        
        print(json)
        print("hello")
        
        var bookList = [String: Book]()
        if let jsonObject = json as? [String:Any]
            
        {
            var book: Book!
            if let jsonArray = jsonObject["books"] as? [Any]
            {
                book = Book()
                for insiderJsonObject in jsonArray
                {
                    //print(insiderJsonObject, terminator:"\n\n\n\n\n")
                    if let jsonDictionay =  insiderJsonObject as? [String: Any]
                    {
                        if let bookId = jsonDictionay["id"] as? String
                        {
                            print(bookId)
                            book.id = Int(bookId) ?? 0
                        }
                    }
                    
                }
            }
        }
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

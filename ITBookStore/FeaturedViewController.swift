//
//  FeaturedViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-18.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
var book_array = Array<Book>()
    var cat_array = Array<String>()
@IBOutlet weak var tblBooks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.title = "Featured"
        readJsonFileArray(jsonFileName: "Books")
        self.tblBooks.delegate = self
        self.tblBooks.dataSource = self
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
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            print("Error in converting in json")
            return
        }
        
        // print(json)
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
                        if let bookCat = jsonDictionay["Category"] as? String
                        {
                            print(bookCat)
                            book.category = bookCat
                            
                        }
//                        if let bookName = jsonDictionay["book_name"] as? String
//                        {
//                            //print(bookName)
//                            book.bookName = bookName
//                        }
//                        if let authorName = jsonDictionay["author_name"] as? String
//                        {
//                            //print(authorName)
//                            book.AuthorName = authorName
//                        }
//                        if let bookPrice = jsonDictionay["price"] as? String
//                        {
//                            //print(bookPrice)
//                            book.price = bookPrice
//                        }
//                        if let bookDesc = jsonDictionay["desc"] as? String
//                        {
//                            // print(bookDesc)
//                            book.description = bookDesc
//                        }
                        
                    }
                    
                    self.cat_array += [book.category]
                    
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cat_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! UITableViewCell
        //cell= self.book_array[indexPath.row].id
        cell.textLabel?.text = self.cat_array[indexPath.row]
      //  cell.detailTextLabel?.text = "Book NAme : \(self.book_array[indexPath.row].bookName)"
        return cell
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

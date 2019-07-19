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
    var count = 0
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
                        if let jsonArray1 = jsonDictionay["cat1"] as? [Any]
                        {
                            for insiderJsonObject1 in jsonArray1
                            {
                                //print(insiderJsonObject1, terminator:"\n\n\n\n\n")
                                
                                if let jsonDictionay1 =  insiderJsonObject1 as? [String: Any]
                                {
                                if let bookId = jsonDictionay1["id"] as? String
                                {
                                print(bookId)
                                book.id = Int(bookId) ?? 0
                                
                                }
                                if let bookName = jsonDictionay1["book_name"] as? String
                                {
                                print(bookName)
                                book.bookName = bookName
                                }
                                if let authorName = jsonDictionay1["author_name"] as? String
                                {
                                print(authorName)
                                book.AuthorName = authorName
                                }
                                if let bookPrice = jsonDictionay1["price"] as? String
                                {
                                print(bookPrice)
                                book.price = bookPrice
                                }
                                if let bookDesc = jsonDictionay1["desc"] as? String
                                {
                                print(bookDesc)
                                book.description = bookDesc
                                }
                                
                                }
                                
                            }
                    }
          
                        
                    }
                    
                    self.cat_array += [book.category]
                    var aBook = Book(bookId: book.id, bookName: book.bookName, bookAuthor: book.AuthorName, bookPrice: book.price, bookDesc: book.description,bookCat: book.category)
                    self.book_array += [aBook]
                    Book.clicked_book.book_array += [aBook]
                    
                    
                    book.addBook(book: aBook)
                    
                
                   
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
        // click action on perticular customer name using tap gesture
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapToGoOnSubCategory(_:)))
                cell.tag = indexPath.row
                cell.addGestureRecognizer(tapGesture)
        
        return cell
    }
        @objc func tapToGoOnSubCategory(_ sender: UITapGestureRecognizer) {
            print(sender.view!.tag)// to display index
            // let sb = UIStoryboard(name: "Main", bundle: nil)
            //let cust = sb.instantiateViewController(withIdentifier: "customerDetail") as! ShowBillDetailsViewController
    
    
            //self.navigationController?.pushViewController(cust,animated: true)
            // to get perticular index
            Book.clicked_book = self.book_array[(sender.view?.tag)!]
            self.performSegue(withIdentifier: "goToSubCat", sender: nil)
    
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

//
//  SubCategoryViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-19.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class SubCategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    
    @IBOutlet weak var tblSubCategory: UITableView!
    var array=Array<Book>()
    var selectedCategory : Int?
    var f = FeaturedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sCat = selectedCategory {
            switch(sCat){
            case 0:
                print("Computer Science")
                 readJsonFileArray(jsonFileName: "Books", category: "Computer Science")
//                for value in array
//                {
//                    print(value.bookName)
//                }
//                let delegate = UIApplication.shared.delegate as! AppDelegate
//                for (key,value) in delegate.books["Science"]!
//                {
//                    array.append(value)
//                }
                
            case 1:
                print("MultiMedia")
                 readJsonFileArray(jsonFileName: "Books", category: "MultiMedia")
//                let delegate = UIApplication.shared.delegate as! AppDelegate
//                for (key,value) in delegate.books["MultiMedia"]!
//                {
//                    array.append(value)
//                }
            case 2:
                readJsonFileArray(jsonFileName: "Books", category: "Networking")
                
            case 3:
                 readJsonFileArray(jsonFileName: "Books", category: "Software")
            
            case 4:
                 readJsonFileArray(jsonFileName: "Books", category: "Programming")
                
            default:
                print("Something Went Wrong")
            }
        }

        // Do any additional setup after loading the view.
        self.tblSubCategory.delegate = self
        self.tblSubCategory.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(Book.clicked_book.book_Dictionary.count)
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "subCatCell") as! UITableViewCell
       // let b = f.book_array[indexPath.row]
        print(indexPath.row)
        cell.textLabel?.text = array[indexPath.row].bookName
        cell.detailTextLabel?.text = array[indexPath.row].price
        // click action on perticular customer name using tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapToGoOnDesc(_:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)

        return cell
    }
    @objc func tapToGoOnDesc(_ sender: UITapGestureRecognizer) {
        print(sender.view!.tag)// to display index
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let descBook = sb.instantiateViewController(withIdentifier: "furtherDesc") as! DescViewController
        descBook.selectedBook = sender.view?.tag ?? 0
        descBook.seletedCat = self.selectedCategory
        
        self.navigationController?.pushViewController(descBook,animated: true)
        // to get perticular index
        //            Book.clicked_book = self.book_array[(sender.view?.tag)!]
        //            self.performSegue(withIdentifier: "goToSubCat", sender: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func readJsonFileArray(jsonFileName: String, category:String) -> [Book]
    {
        var arrayOfBooks=Array<Book>()
        
        let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
        
        guard let jsonData = url else{
            print("Error in reading the url ")
            return []
        }
        
        guard let data = try? Data(contentsOf: jsonData) else {
            print("Error in converting in data")
            return []
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            print("Error in converting in json")
            return []
        }
        
        // print(json)
        print("hello")
        
        if let jsonObject = json as? [String:Any]
            
        {
            var book: Book!
            if let jsonArray = jsonObject["books"] as? [Any]
            {
               
                for insiderJsonObject1 in jsonArray
                {
                     book = Book()
                    //print(insiderJsonObject1, terminator:"\n\n\n\n\n")
                        if let jsonDictionay1 =  insiderJsonObject1 as? [String: Any]
                        {
                            
                            
                            if let bookId = jsonDictionay1["id"] as? String
                            {
                                //print(bookId)
                                book.id = Int(bookId) ?? 0
                            }
                            
                            if let bookName = jsonDictionay1["book_name"] as? String
                            {
                                //print(bookName)
                                book.bookName = bookName
                            }
                            
                            if let authorName = jsonDictionay1["author_name"] as? String
                            {
                                //print(authorName)
                                book.AuthorName = authorName
                            }
                            
                            if let bookPrice = jsonDictionay1["price"] as? String
                            {
                               // print(bookPrice)
                                book.price = bookPrice
                            }
                            
                            if let bookDesc = jsonDictionay1["desc"] as? String
                            {
                                //print(bookDesc)
                                book.description = bookDesc
                            }
                            if let bookCat = jsonDictionay1["category"] as? String
                            {
                                //print(bookCat)
                                book.category = bookCat
                            }
                            
                            if book.category == category
                            {
                                array.append(book)
                              
                            }
                            
                        }
                        }
            }
        }
     
        return arrayOfBooks
    }
    
    
}

//
//  DescViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-20.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class DescViewController: UIViewController {

    @IBOutlet weak var lblBookId: UILabel!
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
  
    @IBOutlet weak var tvDesc: UITextView!
    var selectedBook : Int?
    var seletedCat : Int?
    var array=Array<Book>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if let dd = selectedBook {
        //print("Selected Book is \(dd)")
            switch(dd){
            case 0:
                print("0")
                if let cc = seletedCat{
                    switch(cc){
                    case 0:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 1)
                    case 1:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 6)
                    case 2:
                        print("")
                    case 3:
                        print("")
                    case 4:
                        print("")
                    default:
                        print("Something Went Wrong")
                    }
                }
                //readJsonFileArray(jsonFileName: "Books", rBookId: 1)
                
                for value in array
                {
                    self.lblBookId.text = String(value.id)
                    self.lblBookName.text = value.bookName
                    self.lblAuthorName.text = value.AuthorName
                    self.lblPrice.text = value.price
                    self.tvDesc.text = value.description
                }
               
               
            case 1:
                print("1")
                
                if let cc = seletedCat{
                    switch(cc){
                    case 0:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 2)
                    case 1:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 7)
                    case 2:
                        print("")
                    case 3:
                        print("")
                    case 4:
                        print("")
                    default:
                        print("Something Went Wrong")
                    }
                }
                
                for value in array
                {
                    self.lblBookId.text = String(value.id)
                    self.lblBookName.text = value.bookName
                    self.lblAuthorName.text = value.AuthorName
                    self.lblPrice.text = value.price
                    self.tvDesc.text = value.description
                }
             
            case 2:
                print("2")
                if let cc = seletedCat{
                    switch(cc){
                    case 0:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 3)
                    case 1:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 8)
                    case 2:
                        print("")
                    case 3:
                        print("")
                    case 4:
                        print("")
                    default:
                        print("Something Went Wrong")
                    }
                }
               
                for value in array
                {
                    self.lblBookId.text = String(value.id)
                    self.lblBookName.text = value.bookName
                    self.lblAuthorName.text = value.AuthorName
                    self.lblPrice.text = value.price
                    self.tvDesc.text = value.description
                }
            case 3:
                print("3")
                if let cc = seletedCat{
                    switch(cc){
                    case 0:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 4)
                    case 1:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 9)
                    case 2:
                        print("")
                    case 3:
                        print("")
                    case 4:
                        print("")
                    default:
                        print("Something Went Wrong")
                    }
                }
               
                for value in array
                {
                    self.lblBookId.text = String(value.id)
                    self.lblBookName.text = value.bookName
                    self.lblAuthorName.text = value.AuthorName
                    self.lblPrice.text = value.price
                    self.tvDesc.text = value.description
                }
            case 4:
                print("4")
                if let cc = seletedCat{
                    switch(cc){
                    case 0:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 5)
                    case 1:
                        readJsonFileArray(jsonFileName: "Books", rBookId: 10)
                    case 2:
                        print("")
                    case 3:
                        print("")
                    case 4:
                        print("")
                    default:
                        print("Something Went Wrong")
                    }
                }
                
                for value in array
                {
                    self.lblBookId.text = String(value.id)
                    self.lblBookName.text = value.bookName
                    self.lblAuthorName.text = value.AuthorName
                    self.lblPrice.text = value.price
                    self.tvDesc.text = value.description
                }
            default:
                print("SomeThing Went Wrong")
            }
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
    
    @IBAction func btnWishList(_ sender: UIButton) {
        
    }
    
    @IBAction func btnCart(_ sender: UIButton) {
        
    }
    
    
    
    

    
    func readJsonFileArray(jsonFileName: String, rBookId:Int)
    {
        var arrayOfBooks=Array<Book>()
        
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
                            //print(bookPrice)
                            book.price = bookPrice
                        }
                        
                        if let bookDesc = jsonDictionay1["desc"] as? String
                        {
                            //print(bookDesc)
                            book.description = bookDesc
                        }
                        if let bookCat = jsonDictionay1["category"] as? String
                        {
                            //'print(bookCat)
                            book.category = bookCat
                        }
                        if book.id == rBookId{
                       
                        print("its printing")
                         array.append(book)
                        }
                        
                        
                    }
                  
                    
                  
//                    for a in arrayOfBooks {
//                        if book.id == rBookId{
//                            array.append(book)
//                        }
//                    }
                    
                }
            
//                 print(book.id)
//                if book.id == bookId
//                {
//                    print("Appendingggggggggg")
//
//
//                    self.lblBookId.text = String(book.id)
//                    self.lblBookName.text = String(book.bookName)
//
//                }
//                else {
//                    print("no match")
//                }
            }
        }
        
       
    }
}
//
//  Book.swift
//  ITBookStore
//
//  Created by Sidharth Nayyar on 2019-07-19.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import Foundation
class Book {
    
    var id: Int
    var bookName: String
    var AuthorName: String
    var price: String
    var description: String
    
    init(){
        self.id = Int()
        self.bookName = String()
        self.AuthorName = String()
        self.price = String()
        self.description = String()
        
    }
    init(bookId: Int,bookName: String,bookAuthor:String,bookPrice:String,bookDesc:String) {
        self.id = bookId
        self.bookName = bookName
        self.AuthorName = bookAuthor
        self.price = bookPrice
        self.description = bookDesc
    }
    
}





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
    var category: String
    static var clicked_book = Book()
    var book_Dictionary = [Int:Book]()
    var book_array = Array<Book>()
    
    init(){
        self.id = Int()
        self.bookName = String()
        self.AuthorName = String()
        self.price = String()
        self.description = String()
        self.category = String()
        
    }
    init(bookId: Int,bookName: String,bookAuthor:String,bookPrice:String,bookDesc:String,bookCat: String) {
        self.id = bookId
        self.bookName = bookName
        self.AuthorName = bookAuthor
        self.price = bookPrice
        self.description = bookDesc
        self.category = bookCat
    }
    func addBook(book : Book) {
        self.book_Dictionary.updateValue(book, forKey: book.id)
    }
    
}





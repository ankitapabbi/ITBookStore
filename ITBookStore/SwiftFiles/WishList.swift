//
//  WishList.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-20.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import Foundation
class WishList {
    
    var id: String
    var bookName: String
    
    var category: String
    static var clicked_book = WishList()
    static var wish_Dictionary = [Int:WishList]()
    var wish_array = Array<WishList>()
    
    init(){
        self.id = String()
        self.bookName = String()
        self.category = String()
        
    }
    init(bookId: String,bookName: String,bookCat: String) {
        self.id = bookId
        self.bookName = bookName
        self.category = bookCat
    }
    func addBook(book : WishList) {
       // WishList.wish_Dictionary.updateValue(book, forKey: Int(book.id)!)
        wish_array.append(book)
    }
    
}

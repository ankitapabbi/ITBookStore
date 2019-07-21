//
//  Cart.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-20.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import Foundation
class Cart {
    
    var id: String
    var bookName: String
    var price: String
    var category: String
    static var clicked_book = Cart()
    static var cart_Dictionary = [Int:Cart]()
    var cart_array = Array<Cart>()
    
    init(){
        self.id = String()
        self.bookName = String()
        self.price = String()
        self.category = String()
        
    }
    init(bookId: String,bookName: String,bookPrice:String,bookCat: String) {
        self.id = bookId
        self.bookName = bookName
        self.price = bookPrice
        self.category = bookCat
    }
    func addBook(book : Cart) {
        //Cart.cart_Dictionary.updateValue(book, forKey: book.id)
        cart_array.append(book)
    }
    
}

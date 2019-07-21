//
//  AppDelegate.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-10.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var books:[String:[Int:Book]] = Dictionary<String, Dictionary<Int, Book>>() //[BookType:[BookID:Book]]
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        readJsonFileArray()
        //print(books["Science"]![1]?.bookName)
        return true
    }
    
    
    func readJsonFileArray()
    {
        var arrayOfBooks=Array<Book>()
        
        let url = Bundle.main.url(forResource: "Books", withExtension: "json")
        
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
                        
                        if var bookCategory = books[book.category]
                        {
                            
                            bookCategory.updateValue(book, forKey:book!.id)
                            
                            books.updateValue(bookCategory, forKey: book.category)
                        }
                        else
                        {
                            
                            
                            books.updateValue([book!.id:book], forKey: book.category)
                            
                        }
                        
                    }
                }
            }
        }
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


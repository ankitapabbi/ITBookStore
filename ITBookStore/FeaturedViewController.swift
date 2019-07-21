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
    var cat_array = ["Computer Science","MultiMedia","Networking","Software","Programming"]
    var count = 0
    
var bookList = [Book]()
    
@IBOutlet weak var tblBooks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.title = "Featured"
        //readJsonFileArray(jsonFileName: "Books")
        self.tblBooks.delegate = self
        self.tblBooks.dataSource = self
        // Do any additional setup after loading the view.
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
             let sb = UIStoryboard(name: "Main", bundle: nil)
            let subBook = sb.instantiateViewController(withIdentifier: "subCategory") as! SubCategoryViewController
            subBook.selectedCategory = sender.view?.tag ?? 0
    
            self.navigationController?.pushViewController(subBook,animated: true)
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

}

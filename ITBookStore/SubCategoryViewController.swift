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
    var f = FeaturedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblSubCategory.delegate = self
        self.tblSubCategory.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(Book.clicked_book.book_Dictionary.count)
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "subCatCell") as! UITableViewCell
       // let b = f.book_array[indexPath.row]
        
        cell.textLabel?.text = "Book Name : \(Book.clicked_book.bookName)"
        cell.detailTextLabel?.text = "Price : \(Book.clicked_book.price)"
        
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

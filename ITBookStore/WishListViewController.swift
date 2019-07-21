//
//  WishListViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-18.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    

    @IBOutlet weak var tblWishList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WishList"
        self.tblWishList.delegate = self
        self.tblWishList.dataSource = self
        self.tblWishList.reloadData()
        
        // Do any additional setup after loading the view.
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(WishList.clicked_book.wish_array.count)
        return WishList.clicked_book.wish_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "wishCell") as! UITableViewCell
//        //cell= self.book_array[indexPath.row].id
        cell.textLabel?.text = WishList.clicked_book.wish_array[indexPath.row].bookName
        cell.detailTextLabel?.text = WishList.clicked_book.wish_array[indexPath.row].category
//        // click action on perticular customer name using tap gesture
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapToGoOnSubCategory(_:)))
//        cell.tag = indexPath.row
//        cell.addGestureRecognizer(tapGesture)
        
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

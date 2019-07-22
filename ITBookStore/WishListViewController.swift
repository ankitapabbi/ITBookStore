//
//  WishListViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-18.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    

    @IBOutlet weak var lblWishCount: UILabel!
    @IBOutlet weak var tblWishList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WishList"
        self.tblWishList.delegate = self
        self.tblWishList.dataSource = self
        self.tblWishList.reloadData()
       
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tblWishList.reloadData()
        self.lblWishCount.text = String(WishList.clicked_book.wish_array.count)
        
        
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let book = WishList.clicked_book.wish_array[indexPath.row].bookName
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view,
            actionPerformed: @escaping (Bool) -> Void) in
            
            let alert = UIAlertController(title: "Delete Book", message: "Are you sure you want to delete this book : \(book) ?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // Perform delete
                WishList.clicked_book.deleteBook(index: indexPath.row)
                //self.tblWishList.reloadData()
                self.tblWishList.deleteRows(at: [indexPath], with: .automatic)
                self.lblWishCount.text = String(WishList.clicked_book.wish_array.count)
                actionPerformed(true)
            }))
            self.present(alert,animated: true)
            
           
        }
        delete.image = UIImage(named: "deleteicon")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification
        userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        
        // increase badge count, but no need if you include content-available
        
        application.applicationIconBadgeNumber = application.applicationIconBadgeNumber + 1
        
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

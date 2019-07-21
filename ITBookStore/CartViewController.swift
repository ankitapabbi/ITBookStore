//
//  CartViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-18.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    @IBOutlet weak var tblCart: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        self.tblCart.delegate = self
        self.tblCart.dataSource = self
        self.tblCart.reloadData()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tblCart.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return Cart.clicked_book.cart_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! CartLayoutTableViewCell
        cell.lblCategory.text = Cart.clicked_book.cart_array[indexPath.row].category
        cell.lblBookName.text = Cart.clicked_book.cart_array[indexPath.row].bookName
        cell.lblPrice.text = Cart.clicked_book.cart_array[indexPath.row].price
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let book = Cart.clicked_book.cart_array[indexPath.row].bookName
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view,
            actionPerformed: @escaping (Bool) -> Void) in
            
            let alert = UIAlertController(title: "Delete Book", message: "Are you sure you want to delete this book : \(book) ?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // Perform delete
                Cart.clicked_book.deleteBook(index: indexPath.row)
                //self.tblCart.reloadData()
                self.tblCart.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            self.present(alert,animated: true)
            
            
        }
        delete.image = UIImage(named: "deleteicon")
        return UISwipeActionsConfiguration(actions: [delete])
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

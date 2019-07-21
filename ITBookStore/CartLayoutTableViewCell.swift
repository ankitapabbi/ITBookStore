//
//  CartLayoutTableViewCell.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-21.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class CartLayoutTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblBookName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lblPrice: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

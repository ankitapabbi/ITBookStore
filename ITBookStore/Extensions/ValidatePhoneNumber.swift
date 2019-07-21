//
//  ValidatePhoneNumber.swift
//  ITBookStore
//
//  Created by Sidharth Nayyar on 2019-07-21.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import Foundation

extension String {

    func isValidMobile() -> Bool
        
    {
        let mobileRegEx = "^[1{1}]\\s\\d{3}-\\d{3}-\\d{4}$"
        let mobileTest = NSPredicate(format:"SELF MATCHES %@", mobileRegEx)
        return mobileTest.evaluate(with: self)
    }
    
}

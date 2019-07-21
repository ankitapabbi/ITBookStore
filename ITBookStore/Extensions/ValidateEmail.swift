//
//  ValidateEmail.swift
//  ITBookStore
//
//  Created by Sidharth Nayyar on 2019-07-18.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import Foundation
extension String {
    
    func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    
    
}


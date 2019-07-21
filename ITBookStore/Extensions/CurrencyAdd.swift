//
//  CurrencyAdd.swift
//  ITBookStore
//
//  Created by Sidharth Nayyar on 2019-07-21.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import Foundation
extension Float {
        
        public func currency() -> String
        {
            return String.init(format: "$%0.2f", self)
        }
    }
    

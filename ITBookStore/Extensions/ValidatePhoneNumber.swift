//
//  ValidatePhoneNumber.swift
//  ITBookStore
//
//  Created by Sidharth Nayyar on 2019-07-21.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import Foundation

extension String {

  
//    func isValidMobile() -> Bool
//    {
//        let mobileRegEx = "^[1{1}]\\s\\d{3}-\\d{3}-\\d{4}$"
//        let mobileTest = NSPredicate(format:"SELF MATCHES %@", mobileRegEx)
//        return mobileTest.evaluate(with: self)
//    }
////    var isValidPhoneNumber: Bool {
//        do {
//            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
//            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
//            if let res = matches.first {
//                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
//            } else {
//                return false
//            }
//        } catch {
//            return false
//        }
//    }
//
    func validatePNumber(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
//
}

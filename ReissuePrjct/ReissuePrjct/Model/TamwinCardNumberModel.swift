//
//  TamwinCardNumberModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import Foundation

class TamwinCardNumberModel: NSObject {
    var tamwinCardNumber:String = ""
   
    init(_ dict:[String:Any]) {
        tamwinCardNumber = dict["tamwinCardNumber"] as? String ?? ""
    }
}

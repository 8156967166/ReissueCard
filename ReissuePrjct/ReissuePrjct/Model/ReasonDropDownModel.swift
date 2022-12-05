//
//  ReasonDropDownModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import Foundation


class ReasonDropDownModel: NSObject {
    var reasonSelect:String = ""
   
    init(_ dict:[String:Any]) {
        reasonSelect = dict["reasonSelect"] as? String ?? ""
    }
}

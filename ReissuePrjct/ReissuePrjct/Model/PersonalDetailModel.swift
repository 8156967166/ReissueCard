//
//  PersonalDetailModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import Foundation

class PersonalDetailModel: NSObject {
    var title:String = ""
   
    init(_ dict:[String:Any]) {
        title = dict["title"] as? String ?? ""
    }
}

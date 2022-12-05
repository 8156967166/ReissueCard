//
//  ReasonModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

class ReasonModel: NSObject {
    var title:String = ""
   
    init(_ dict:[String:Any]) {
        title = dict["title"] as? String ?? ""
    }
}

//
//  DocumentdropDownModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

class DocumentdropDownModel: NSObject {
    var documentSelect:String = ""
   
    init(_ dict:[String:Any]) {
        documentSelect = dict["documentSelect"] as? String ?? ""
    }
}

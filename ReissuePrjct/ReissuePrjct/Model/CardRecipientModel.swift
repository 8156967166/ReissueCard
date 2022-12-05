//
//  CardRecipientModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

class CardRecipientModel: NSObject {
    var cardTitle:String = ""
   
    init(_ dict:[String:Any]) {
        cardTitle = dict["cardTitle"] as? String ?? ""
    }
}

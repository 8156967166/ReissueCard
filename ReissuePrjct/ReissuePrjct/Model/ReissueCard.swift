//
//  ReissueCard.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import Foundation

class ReissueCard: NSObject {
    var familyNumber:String = ""
    var requestNumber:String = ""
    var familyType:String = ""
    var tamwinCard: String = ""
    var reason: String = ""
    var remark: String = ""
    var document:  String = ""
    var image: String = ""
    var imageSize: String = ""
    var cardRecipientName: String = ""
    var cardRecipientID: String = ""
    var cardRecipientMobileNo: String = ""
    var cardRecipientRelationship: String = ""
   
   
    init(_ dict:[String:Any]) {
        familyNumber = dict["familyNumber"] as? String ?? ""
        requestNumber = dict["requestNumber"] as? String ?? ""
        familyType = dict["familyType"] as? String ?? ""
        tamwinCard = dict["tamwinCard"] as? String ?? ""
        reason = dict["reason"] as? String ?? ""
        remark = dict["remark"] as? String ?? ""
        document = dict["document"] as? String ?? ""
        image = dict["image"] as? String ?? ""
        imageSize = dict["imageSize"] as? String ?? ""
        cardRecipientName = dict["cardRecipientName"] as? String ?? ""
        cardRecipientID = dict["cardRecipientID"] as? String ?? ""
        cardRecipientMobileNo = dict["cardRecipientMobileNo"] as? String ?? ""
        cardRecipientRelationship = dict["cardRecipientRelationship"] as? String ?? ""
        
    }
    
}

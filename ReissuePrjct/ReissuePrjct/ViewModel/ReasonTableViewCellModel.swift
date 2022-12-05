//
//  ReasonTableViewCellModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import Foundation

enum ReasonCellType {
    case reasonCell
    case documentCell
    case remarkCell
    case imageCell
    case imageSizeCell
}

class ReasonTableViewCellModel {
    
    var identifier: String = "reasonDropDown.Cell"
    var cellType: ReasonCellType = .reasonCell
    var reasonDetails: ReasonModel = ReasonModel([:])
    var errorCard: ReissueCard = ReissueCard([:])
    var enteredTextFieldReason: String = ""
    var isSelected: Bool = false
    var isSelectImage: Bool = false
    var isSelectDoc: Bool = false
    
    init(strtitle: String, celltype: ReasonCellType, _ errorCard:ReissueCard) {
        self.cellType = celltype
        self.errorCard = errorCard
        self.reasonDetails.title = strtitle
        switch celltype {
        case .reasonCell:
            identifier = "reasonDropDown.Cell"
        case .documentCell:
            identifier = "document.Cell"
        case .remarkCell:
            identifier = "remark.Cell"
        case .imageCell:
            identifier = "image.Cell"
        case .imageSizeCell:
            identifier = "imageSize.Cell"
        }
    }
    
    func getReasonTitle() ->String {
        return reasonDetails.title
    }
    
    func getReasonError() ->String {
        
        return errorCard.reason
    }
    
    func getDocumentError() ->String {
        return errorCard.document
    }
}

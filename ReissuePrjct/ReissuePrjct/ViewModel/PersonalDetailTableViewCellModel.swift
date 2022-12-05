//
//  PersonalDetailTableViewcellModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import Foundation

enum PersonalDetailCelltype {
    case familyNumberCell
    case TamwinCardNumberCell
    case requestNumberCell
    case familyTypeCell
   
}

class PersonalDetailTableViewCellModel {
    
    var identifier: String = "personalDetailTextField.Cell"
    var cellType: PersonalDetailCelltype = .familyNumberCell
    var personalDetails: PersonalDetailModel = PersonalDetailModel([:])
    var errorCard: ReissueCard = ReissueCard([:])
    var isSelected: Bool = false
    var enteredTextFieldPersonalDetail: String = ""
    
    init(strtitle: String, celltype: PersonalDetailCelltype, _ errorCard:ReissueCard) {
        self.cellType = celltype
        self.errorCard = errorCard
        self.personalDetails.title = strtitle
        switch celltype {
        case .familyNumberCell:
            identifier = "personalDetailTextField.Cell"
        case .TamwinCardNumberCell:
            identifier = "TamwinCardNumberDropDown.Cell"
        case .requestNumberCell:
            identifier = "personalDetailTextField.Cell"
        case .familyTypeCell:
            identifier = "personalDetailTextField.Cell"
       
        }
    }
    
    
    func getPersonalDetail() ->String {
        return personalDetails.title
    }
    
    func getPersonalDetailError() ->String {
//        return errorCard.requestNumber
        
        if cellType == .familyNumberCell {
            return errorCard.familyNumber
        }
        else if cellType == .familyTypeCell {
            return errorCard.familyType
        }
        else {
            return errorCard.requestNumber
        }
    }
    
    
}

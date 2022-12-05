//
//  CardRecipientTableViewCellModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

enum CardRecipientCellType {
    case cardRecipientNameCell
    case cardRecipientIDCell
    case cardRecipientMobileNoCell
    case cardRecipientRelationship
}

class CardRecipientTableViewCellModel {
    var identifier: String = "cardRecipient.Cell"
    var cellType: CardRecipientCellType = .cardRecipientNameCell
    var cardRecipientDetail: CardRecipientModel = CardRecipientModel([:])
    var isSelect: Bool = false
    var errorCardRecipient:ReissueCard = ReissueCard([:])
    
    init(strTitle: String, celltype: CardRecipientCellType, _ errorCard:ReissueCard) {
        self.cellType = celltype
        self.errorCardRecipient = errorCard
        self.cardRecipientDetail.cardTitle = strTitle
        switch celltype {
        case .cardRecipientNameCell:
            identifier = "cardRecipient.Cell"
        case .cardRecipientIDCell:
            identifier = "cardRecipient.Cell"
        case .cardRecipientMobileNoCell:
            identifier = "cardRecipient.Cell"
        case .cardRecipientRelationship:
            identifier = "cardRecipient.Cell"
        }
    }
    
    func getCardRecipient() ->String {
        return cardRecipientDetail.cardTitle
    }
    
    func getCradRecipientError() ->String {
        switch cellType {
        case .cardRecipientNameCell:
            return errorCardRecipient.cardRecipientName
        case .cardRecipientIDCell:
            return errorCardRecipient.cardRecipientID
        case .cardRecipientMobileNoCell:
            return errorCardRecipient.cardRecipientMobileNo
        case .cardRecipientRelationship:
            return errorCardRecipient.cardRecipientRelationship
        }
    }
}

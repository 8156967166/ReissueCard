//
//  DeliveryModeTableViewcellModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import Foundation

enum DeliveryCellType {
    case deliveryModecell
    case requiredFeeCell
    case collectFromCounterCell
}

class DeliveryModeTableViewcellModel {
    
    var identifier: String = "deliveryMode.Cell"
    var cellType: DeliveryCellType = .deliveryModecell
    var deliveryModeDetails: DeliveryModeModel = DeliveryModeModel([:])
    var errorCard: ReissueCard = ReissueCard([:])
    var isSelected: Bool = false
    
    init(strtitle: String, celltype: DeliveryCellType) {
        self.cellType = celltype
        self.deliveryModeDetails.title = strtitle
        switch celltype {
        case .deliveryModecell:
            identifier = "deliveryMode.Cell"
        case .requiredFeeCell:
            identifier = "requiredFee.Cell"
        case .collectFromCounterCell:
            identifier = "collectFromCounter.Cell"
        }
    }
    
    func getDeliveryModeTitle() ->String {
        return deliveryModeDetails.title
    }
    
}

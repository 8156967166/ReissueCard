//
//  ReasonDropDownTableViewCellModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import Foundation
enum ReasonDropDownCellType {
    case reasonDropDownCell
}

class ReasonDropDownTableViewCellModel {
    var identifier: String = "reasonSelectDropDown.Cell"
    var cellType: ReasonDropDownCellType = .reasonDropDownCell
    var reasonDetail: ReasonDropDownModel = ReasonDropDownModel([:])
    var isSelect: Bool = false
    
    init(strReason: String, celltype: ReasonDropDownCellType) {
        self.cellType = celltype
        self.reasonDetail.reasonSelect = strReason
        switch celltype {
        case .reasonDropDownCell:
            identifier = "reasonSelectDropDown.Cell"
        }
    }
    
    func getReasonSelect() ->String {
        return reasonDetail.reasonSelect
    }
}

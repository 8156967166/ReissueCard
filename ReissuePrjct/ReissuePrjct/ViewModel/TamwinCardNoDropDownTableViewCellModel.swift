//
//  TamwinCardNoDropDownTableViewCellModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

enum TamwinCardDropDownCellType {
    case tamwindropDownCell
}

class TamwinCardNoDropDownTableViewCellModel: NSObject {

    var identifier: String = "TamwinCardDropDown.Cell"
    var cellType: TamwinCardDropDownCellType = .tamwindropDownCell
    var tamwinCardNoDetail: TamwinCardNumberModel = TamwinCardNumberModel([:])
    var isSelect: Bool = false
    
    init(strNumber: String, celltype: TamwinCardDropDownCellType) {
        self.cellType = celltype
        self.tamwinCardNoDetail.tamwinCardNumber = strNumber
        switch celltype {
        case .tamwindropDownCell:
            identifier = "TamwinCardDropDown.Cell"
       
        }
    }
    
    
    func getTamwinCardNumber() ->String {
        return tamwinCardNoDetail.tamwinCardNumber
    }
    
}

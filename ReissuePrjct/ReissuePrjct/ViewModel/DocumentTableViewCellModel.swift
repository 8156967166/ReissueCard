//
//  DocumentTableViewCellModel.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit


enum DocumentDropDownCellType {
    case documentDropDownCell
}

class DocumentTableViewCellModel {
    var identifier: String = "documentDropDown.Cell"
    var cellType: DocumentDropDownCellType = .documentDropDownCell
    var documentDetail: DocumentdropDownModel = DocumentdropDownModel([:])
    var isSelect: Bool = false
    
    init(strdocument: String, celltype: DocumentDropDownCellType) {
        self.cellType = celltype
        self.documentDetail.documentSelect = strdocument
        switch celltype {
        case .documentDropDownCell:
            identifier = "documentDropDown.Cell"
        }
    }
    
    func getDocumentSelect() ->String {
        return documentDetail.documentSelect
    }
}

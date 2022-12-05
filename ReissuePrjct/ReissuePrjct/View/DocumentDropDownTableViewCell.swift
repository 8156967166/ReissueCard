//
//  DocumentDropDownTableViewCell.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

class DocumentDropDownTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelInDocumentSelect: UILabel!
    
    var cellModelInDocumentDropDown: DocumentTableViewCellModel! {
        didSet {
            setDocumentDropDownItems()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDocumentDropDownItems() {
        labelInDocumentSelect.text = cellModelInDocumentDropDown.getDocumentSelect()
    }

}

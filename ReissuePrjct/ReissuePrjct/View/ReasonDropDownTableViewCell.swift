//
//  ReasonDropDownTableViewCell.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

class ReasonDropDownTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelInReasonSelect: UILabel!
    
    
    var cellModelInReasondropDown: ReasonDropDownTableViewCellModel! {
        didSet {
            setReasonDropDownitem()
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
    
    func setReasonDropDownitem() {
        labelInReasonSelect.text = cellModelInReasondropDown.getReasonSelect()
    }

}

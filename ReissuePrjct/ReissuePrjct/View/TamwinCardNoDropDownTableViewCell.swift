//
//  TamwinCardNoDropDownTableViewCell.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

class TamwinCardNoDropDownTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTamwincardNumber: UILabel!
    
    
    var cellModelInTamwincard: TamwinCardNoDropDownTableViewCellModel! {
        didSet {
            setmTamwinCarditems()
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
    
    func setmTamwinCarditems() {
        labelTamwincardNumber.text = cellModelInTamwincard.getTamwinCardNumber()
    }

}

//
//  CradRecipientTableViewCell.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

protocol CradRecipientToTableViewCellDelegate {
    func didChangeCradRecipientTextFieldText(_ text:String, cellModel:CardRecipientTableViewCellModel)
}

class CradRecipientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelInCardRecipient: UILabel!
    @IBOutlet weak var labelErrorInCardRecipient: UILabel!
    
    var delegate: CradRecipientToTableViewCellDelegate?
    var color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var cellModelInCardRecipient: CardRecipientTableViewCellModel! {
        didSet {
            setCardRecipientItems()
            setRequiredField()
            configureErrorCell()
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
    
    func setCardRecipientItems() {
        labelInCardRecipient.text = cellModelInCardRecipient.getCardRecipient()
    }
    
    func configureErrorCell() {
//        labelErrorInCardRecipient.backgroundColor = .blue
        labelErrorInCardRecipient.text  = cellModelInCardRecipient.getCradRecipientError()
        
    }
    
    
    func setRequiredField() {
        let mainString = "Card Recipient Name*"
        let stringToColor = "*"
        let range = (mainString as NSString).range(of: stringToColor)

        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
        if cellModelInCardRecipient.cellType == .cardRecipientNameCell {
            labelInCardRecipient.attributedText = mutableAttributedString
        }
        
        
        let mainStringId = "Card Recipient ID *"
        let stringToColorId = "*"
        let rangeId = (mainStringId as NSString).range(of: stringToColorId)

        let mutableAttributedStringId = NSMutableAttributedString.init(string: mainStringId)
        mutableAttributedStringId.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: rangeId)
        
        if cellModelInCardRecipient.cellType == .cardRecipientIDCell {
            labelInCardRecipient.attributedText = mutableAttributedStringId
        }
        
        let mainStringNo = "Card Recipient Mobile. No. *"
        let stringToColorNo = "*"
        let rangeNo = (mainStringNo as NSString).range(of: stringToColorNo)

        let mutableAttributedStringNo = NSMutableAttributedString.init(string: mainStringNo)
        mutableAttributedStringNo.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: rangeNo)
        
        if cellModelInCardRecipient.cellType == .cardRecipientMobileNoCell {
            labelInCardRecipient.attributedText = mutableAttributedStringNo
        }
        
        let mainStringRelationship = "Card Recipient Relationship *"
        let stringToColorRelationship = "*"
        let rangeRelationship = (mainStringRelationship as NSString).range(of: stringToColorRelationship)

        let mutableAttributedStringRelationship = NSMutableAttributedString.init(string: mainStringRelationship)
        mutableAttributedStringRelationship.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: rangeRelationship)
        
        if cellModelInCardRecipient.cellType == .cardRecipientRelationship {
            labelInCardRecipient.attributedText = mutableAttributedStringRelationship
        }
        
    }
    
    @IBAction func textFieldTextChanged(_ textField:UITextField) {
        print("textFieldTextChangedCardRecipientCell... \(textField.text ?? "")")
        self.delegate?.didChangeCradRecipientTextFieldText(textField.text ?? "", cellModel: cellModelInCardRecipient)
    }
    

}

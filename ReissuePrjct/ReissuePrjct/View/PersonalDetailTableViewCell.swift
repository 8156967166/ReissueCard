//
//  PersonalDetailTableViewCell.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

protocol PersonalDetailTableViewCellDelegate {
    func didChangePersonDetailVCTableTextFieldText(_ text:String, cellModel:PersonalDetailTableViewCellModel)
    func didChangePersonDetailVcTableLabeltext(_ label: String, cellModel: PersonalDetailTableViewCellModel)
//    func passTextFieldPersonaldetail(strtextFieldEnter: String, passModel: PersonalDetailTableViewCellModel)
    func buttonActionTamwinCardSelect(sender: UIButton)
}

class PersonalDetailTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var labelInPersonalDetail: UILabel!
    @IBOutlet weak var labelErrorInRequestNumber: UILabel!
    @IBOutlet weak var tableViewInTamwinCardDropDown: UITableView!
    @IBOutlet weak var buttonTamwinSelect: UIButton!
    @IBOutlet weak var heightInTamwinView: NSLayoutConstraint?
    @IBOutlet weak var labelInTamwinSelect: UILabel!
    @IBOutlet weak var textField: UITextField?
    
    var tamwinCardNumberArray: [TamwinCardNoDropDownTableViewCellModel] = []
    var delegate: PersonalDetailTableViewCellDelegate?
    var color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var cellModel: PersonalDetailTableViewCellModel! {
        didSet {
            configureCellPersonalDetail()
            if cellModel.cellType == .familyNumberCell {
                labelErrorInRequestNumber.text = ""
            }
            if cellModel.cellType == .familyTypeCell {
                labelErrorInRequestNumber.text = ""
            }
            if cellModel.cellType == .TamwinCardNumberCell {
                
                setTamwinCardNoModel()
            }
            if cellModel.cellType == .TamwinCardNumberCell {
                if cellModel.isSelected == true {
                    heightInTamwinView?.constant = 113
                }
                else {
                    heightInTamwinView?.constant = 0
                }
            }
            
            textField?.text = cellModel.enteredTextFieldPersonalDetail
            
            let mainString = "Request Number*"
            let stringToColor = "*"
            let range = (mainString as NSString).range(of: stringToColor)

            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            
            if cellModel.cellType == .requestNumberCell {
                labelInPersonalDetail.attributedText = mutableAttributedString
                
            }
            
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
    
    func setTamwinCardNoModel() {
        let card1 = TamwinCardNoDropDownTableViewCellModel(strNumber: "Food Only: 10004589", celltype: .tamwindropDownCell)
        let card2 =  TamwinCardNoDropDownTableViewCellModel(strNumber: "Food Only: 10009867", celltype: .tamwindropDownCell)
        let card3 =  TamwinCardNoDropDownTableViewCellModel(strNumber: "Food Only: 10006512", celltype: .tamwindropDownCell)
        let card4 =  TamwinCardNoDropDownTableViewCellModel(strNumber: "Food Only: 10002138", celltype: .tamwindropDownCell)
        let card5 =  TamwinCardNoDropDownTableViewCellModel(strNumber: "Food Only: 10009134", celltype: .tamwindropDownCell)
       
        tamwinCardNumberArray = [card1, card2, card3, card4, card5]
    }
    
    func configureCellPersonalDetail() {
        labelInPersonalDetail.text = cellModel.getPersonalDetail()
        if cellModel.cellType == .requestNumberCell {
//            labelErrorInRequestNumber.backgroundColor = .blue
            labelErrorInRequestNumber.text = cellModel.getPersonalDetailError()
        }
    }
    
    @IBAction func textFieldTextChanged(_ textField: UITextField) {
        
        self.delegate?.didChangePersonDetailVCTableTextFieldText(textField.text ?? "", cellModel: cellModel)
    }
    
    @IBAction func buttonActionTamwinSelect(sender: UIButton) {
        delegate?.didChangePersonDetailVcTableLabeltext(labelInTamwinSelect.text ?? "", cellModel: cellModel)
        self.delegate?.buttonActionTamwinCardSelect(sender: buttonTamwinSelect)
    }

}

extension PersonalDetailTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tamwinCardNumberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModelInTamwin = tamwinCardNumberArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModelInTamwin.identifier, for: indexPath) as! TamwinCardNoDropDownTableViewCell
       
        if cellModel.cellType == .TamwinCardNumberCell {
            if cellModelInTamwin.isSelect == true {
                heightInTamwinView?.constant = 0
                buttonActionTamwinSelect(sender: buttonTamwinSelect)
            }
            else {
                heightInTamwinView?.constant = 113
            }
        }
        
        cell.cellModelInTamwincard = cellModelInTamwin
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = tamwinCardNumberArray[indexPath.row]
       
        if cellModel.isSelect == true {
            cellModel.isSelect = false
        } else {
            cellModel.isSelect = true
        }
        
        labelInTamwinSelect.text = cellModel.tamwinCardNoDetail.tamwinCardNumber
        tableViewInTamwinCardDropDown.reloadData()
    }

}

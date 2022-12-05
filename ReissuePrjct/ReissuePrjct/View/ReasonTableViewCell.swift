//
//  ReasonTableViewCell.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

protocol ReasonTableViewCellDelegate {
    func buttonActionReasonSelect(sender: UIButton)
    func buttonActionDocumentSelect(sender: UIButton)
    func buttonActionImageAttachment(sender: UIButton)
    func didChangeReasonVCTableLabelText(_ label:String, cellModel:ReasonTableViewCellModel)
    func didChangeDocumentVcTextFieldText(_ text:String, cellModel:ReasonTableViewCellModel)
}

class ReasonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelInReason: UILabel!
    @IBOutlet weak var tabelViewInReason: UITableView!
    @IBOutlet weak var tableViewInDocument: UITableView!
    @IBOutlet weak var buttonReasonSelect: UIButton!
    @IBOutlet weak var heightInReasonDropDownView: NSLayoutConstraint?
    @IBOutlet weak var labelInReasonDropDown: UILabel?
    @IBOutlet weak var buttonDocumentSelect: UIButton!
    @IBOutlet weak var labelInDocumentSelect: UILabel!
    @IBOutlet weak var heightInDocumentView: NSLayoutConstraint?
    @IBOutlet weak var buttonImgeAttach: UIButton!
    @IBOutlet weak var imageViewImageAttachment: UIImageView?
    @IBOutlet weak var heightInImageAttachView: NSLayoutConstraint?
    @IBOutlet weak var viewInImageAttachment: UIView!
    @IBOutlet weak var labelInReasonError: UILabel!
    @IBOutlet weak var labelInDocumentError: UILabel!

    var color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var delegate: ReasonTableViewCellDelegate?
    var reasonDropDownArray: [ReasonDropDownTableViewCellModel] = []
    var documentArray: [DocumentTableViewCellModel] = []
    var cellModelInReason: ReasonTableViewCellModel! {
        didSet {
            configureCellReason()
            configureReasonErrorCell()
            
            let mainString = "Reason*"
            let stringToColor = "*"
            let range = (mainString as NSString).range(of: stringToColor)

            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            
            let mainStrings = "Document Type*"
            let stringToColors = "*"
            let ranges = (mainStrings as NSString).range(of: stringToColors)

            let mutableAttributedStrings = NSMutableAttributedString.init(string: mainStrings)
            mutableAttributedStrings.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: ranges)
            
            if cellModelInReason.cellType == .reasonCell {
                setReasondropDownModel()
                labelInReason.attributedText =  mutableAttributedString
                if cellModelInReason.isSelected == true {
                    heightInReasonDropDownView?.constant = 100
                }
                else {
                    heightInReasonDropDownView?.constant = 0
                }
                
                delegate?.didChangeReasonVCTableLabelText(labelInReasonDropDown?.text ?? "", cellModel: cellModelInReason)
            }
            if cellModelInReason.cellType == .documentCell {
                labelInReason.attributedText =  mutableAttributedStrings
                setDocumentDropDown()
                if cellModelInReason.isSelectDoc == true {
                    heightInDocumentView?.constant = 100
                }
                else {
                    heightInDocumentView?.constant = 0
                }
                
                delegate?.didChangeReasonVCTableLabelText(labelInDocumentSelect?.text ?? "", cellModel: cellModelInReason)
            }
            if cellModelInReason.cellType == .imageCell {
                setRectangle()
            }
        
        
//            labelInReasonDropDown?.text = cellModelInReason.enteredTextFieldReason
            
            
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
    
    func configureCellReason() {
        labelInReason.text = cellModelInReason.getReasonTitle()
    }
    
    func configureReasonErrorCell() {
        
//      labelInReasonError.backgroundColor = .blue
        if cellModelInReason.cellType == .reasonCell {
            labelInReasonError.text  = cellModelInReason.getReasonError()
        }
        if cellModelInReason.cellType == .documentCell {
            labelInDocumentError.text = cellModelInReason.getDocumentError()
        }
    }
    
    func setReasondropDownModel() {
        let cardLost = ReasonDropDownTableViewCellModel(strReason: "Card Lost", celltype: .reasonDropDownCell)
        let damagedCard = ReasonDropDownTableViewCellModel(strReason: "Damaged Card", celltype: .reasonDropDownCell)
        let nameChange = ReasonDropDownTableViewCellModel(strReason: "Name Change", celltype: .reasonDropDownCell)
        let headOfFamilyDeceased = ReasonDropDownTableViewCellModel(strReason: "Head of Family Deceased", celltype: .reasonDropDownCell)
        reasonDropDownArray.append(cardLost)
        reasonDropDownArray.append(damagedCard)
        reasonDropDownArray.append(nameChange)
        reasonDropDownArray.append(headOfFamilyDeceased)
    }
    
    func setDocumentDropDown() {
        let png = DocumentTableViewCellModel(strdocument: "PNG", celltype: .documentDropDownCell)
        let jpge = DocumentTableViewCellModel(strdocument: "JPGE", celltype: .documentDropDownCell)
        
        documentArray.append(png)
        documentArray.append(jpge)
        
    }
    
    
    func setRectangle() {
        
        let Width = viewInImageAttachment.frame.size.width //you can use triangleView.frame.size.height
        let height = viewInImageAttachment.frame.size.height
//        let heightWidth = rectangleView.frame.size.width
        
        let shape = CAShapeLayer()
        
        shape.path = roundedRectangle(Width: Width, height: height)
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 1
//        shape.position = CGPoint(x: 0, y: 0)
        shape.strokeColor = UIColor.gray.cgColor
        shape.lineDashPattern =  [7,5]
        shape.strokeColor = #colorLiteral(red: 0.621047914, green: 0.1558654606, blue: 0.2734069228, alpha: 1)
        viewInImageAttachment.layer.insertSublayer(shape, at: 0)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        endEditing(true)
        return true;
    }
    
    func roundedRectangle(Width: CGFloat, height: CGFloat) -> CGPath {

       let point1 = CGPoint(x: 1 * Width + 14, y: 0 * height)
       let point2 = CGPoint(x: 1 * Width + 14 , y: 1 * height)
       let point3 =  CGPoint(x: 0 * Width, y: 1 * height)
       let point4 =  CGPoint(x: 0 * Width , y: 0 * height)
       let path = CGMutablePath()

       path.move(to: CGPoint(x: 0 * Width, y: 0 * height))
       path.addArc(tangent1End: point1, tangent2End: point2, radius: 2)
       path.addArc(tangent1End: point2, tangent2End: point3, radius: 2)
       path.addArc(tangent1End: point3, tangent2End: point4, radius: 2)
       path.addArc(tangent1End: point4, tangent2End: point1, radius: 2)
//       path.closeSubpath()
       return path
        
    }
    
    @IBAction func buttonActionReasonDropDown(sender: UIButton) {
        if cellModelInReason.cellType == .reasonCell {
//            delegate?.didChangeReasonVCTableLabelText(labelInReasonDropDown?.text ?? "", cellModel: cellModelInReason)
            self.delegate?.buttonActionReasonSelect(sender: buttonReasonSelect)
        }
        if cellModelInReason.cellType == .documentCell {
//            delegate?.didChangeReasonVCTableLabelText(labelInReasonDropDown?.text ?? "", cellModel: cellModelInReason)
//            delegate?.didChangeDocumentVcTableLabelText(labelInDocumentSelect.text ?? "", cellModel: cellModelInReason)
            self.delegate?.buttonActionDocumentSelect(sender: buttonDocumentSelect)
        }
        
    }
    @IBAction func buttonActionImageAttach(sender: UIButton) {
        self.delegate?.buttonActionImageAttachment(sender: buttonImgeAttach)
    }
    
    @IBAction func textFieldTextChanged(_ textField: UITextField) {
        self.delegate?.didChangeDocumentVcTextFieldText(textField.text ?? "", cellModel: cellModelInReason)
    }

}

extension ReasonTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        if cellModelInReason.cellType == .reasonCell {
            returnValue = reasonDropDownArray.count
        }
        else {
            returnValue = documentArray.count
        }
        return returnValue
        
//        return reasonDropDownArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cellModelInReasonDropDown = reasonDropDownArray[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellModelInReasonDropDown.identifier, for: indexPath) as! ReasonDropDownTableViewCell
//        cell.cellModelInReasondropDown = cellModelInReasonDropDown
//        return cell
    
        if cellModelInReason.cellType == .reasonCell {
            
            let cellModelInReasonDropDown = reasonDropDownArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: cellModelInReasonDropDown.identifier, for: indexPath) as! ReasonDropDownTableViewCell
            
            if cellModelInReasonDropDown.isSelect == true {
                heightInReasonDropDownView?.constant = 0
            }
            else {
                heightInReasonDropDownView?.constant = 100
            }
            
            cell.cellModelInReasondropDown = cellModelInReasonDropDown
            
            return cell
            
        }
        
        else {
            let cellModelInDocument = documentArray[indexPath.row]
            let cellDocument = tableView.dequeueReusableCell(withIdentifier: cellModelInDocument.identifier, for: indexPath) as! DocumentDropDownTableViewCell

            if cellModelInDocument.isSelect == true {
                heightInDocumentView?.constant = 0
            }
            else {
                heightInDocumentView?.constant = 100
            }
            cellDocument.cellModelInDocumentDropDown = cellModelInDocument
            return cellDocument
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if cellModelInReason.cellType == .reasonCell {
            
            let cellModelInReasonDropDown = reasonDropDownArray[indexPath.row]
            for model in reasonDropDownArray {
                model.isSelect = false
            }
            cellModelInReasonDropDown.isSelect = true
            labelInReasonDropDown?.text = cellModelInReasonDropDown.reasonDetail.reasonSelect
            buttonActionReasonDropDown(sender: buttonReasonSelect)
            
//            tableViewReason.reloadData()
            
        }
        else {
            let cellModelInDocument = documentArray[indexPath.row]
            for model in documentArray {
                model.isSelect = false
            }
            cellModelInDocument.isSelect = true
            labelInDocumentSelect?.text = cellModelInDocument.documentDetail.documentSelect
            buttonActionReasonDropDown(sender: buttonDocumentSelect)
//            tableViewDocument.reloadData()
        }

    }

}

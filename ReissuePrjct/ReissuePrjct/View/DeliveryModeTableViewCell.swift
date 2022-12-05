//
//  DeliveryModeTableViewCell.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

protocol DeliveryModeTableViewCellDelegate {
    func buttonActionPassQPost(sender: UIButton)
    func buttonActionPassCollectfromCounter(sender: UIButton)
    func didChangeCardRecipientVCTableTextFieldText(_ text:String, cellModel:CardRecipientTableViewCellModel)
    
}

class DeliveryModeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelInDeliveryMode: UILabel?
    @IBOutlet weak var tabelViewInCardRecipient: UITableView!
    @IBOutlet weak var imageInCollectFromCounter: UIImageView?
    @IBOutlet weak var imageInQPost: UIImageView?
    @IBOutlet weak var labelCollectFromCounter: UILabel?
    @IBOutlet weak var labelQPost: UILabel?
    @IBOutlet weak var viewInCollectFromCounter: UIView?
    @IBOutlet weak var viewInQPost: UIView?
    @IBOutlet weak var buttonQPost: UIButton!
    @IBOutlet weak var buttonCollectfromCounter: UIButton!
    
    var card:ReissueCard = ReissueCard([:])
    var errorCard:ReissueCard = ReissueCard([:])
    var delegate: DeliveryModeTableViewCellDelegate?
    var cardRecipientArray: [CardRecipientTableViewCellModel] = []
    var cellModelInDeliveryMode: DeliveryModeTableViewcellModel! {
        didSet {
            configureCellDeliveryMode()
            if cellModelInDeliveryMode.cellType == .collectFromCounterCell {
                setCardRecipientModel()
            }
            setGradientInQPost()
            setGradientInCollectFromCounter()
            
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
    
    func configureCellDeliveryMode() {
        labelInDeliveryMode?.text = cellModelInDeliveryMode.getDeliveryModeTitle()
    }
    
    func setGradientInQPost() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewInQPost?.bounds ?? CGRect.null
                
        viewInQPost?.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setGradientInCollectFromCounter() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewInCollectFromCounter?.bounds ?? CGRect.null
                
        viewInCollectFromCounter?.layer.insertSublayer(gradientLayer, at:0)
    }
    
    
    func setCardRecipientModel() {
        cardRecipientArray = []
        let cardRecipientName = CardRecipientTableViewCellModel(strTitle: "Card Recipient Name*", celltype: .cardRecipientNameCell, errorCard)
        let cardRecipientID = CardRecipientTableViewCellModel(strTitle: "Card Recipient ID *", celltype: .cardRecipientIDCell, errorCard)
        let cardRecipientMobileNo = CardRecipientTableViewCellModel(strTitle: "Card Recipient Mobile. No. *", celltype: .cardRecipientMobileNoCell, errorCard)
        let cardRecipientRelationship = CardRecipientTableViewCellModel(strTitle: "Card Recipient Relationship *", celltype:.cardRecipientRelationship, errorCard)
        cardRecipientArray.append(cardRecipientName)
        cardRecipientArray.append(cardRecipientID)
        cardRecipientArray.append(cardRecipientMobileNo)
        cardRecipientArray.append(cardRecipientRelationship)
    }
    
    func setdisable() {
        imageInCollectFromCounter?.image = UIImage(systemName: "profile")
        imageInQPost?.image = UIImage(systemName: "profile")
        labelCollectFromCounter?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewInCollectFromCounter?.backgroundColor = .lightGray
        viewInQPost?.backgroundColor = .lightGray
        labelQPost?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func buttonActionQPost(sender: UIButton) {
        setdisable()
        imageInQPost?.image = UIImage(named: "selectedDeliveryImg")
        viewInQPost?.backgroundColor = .white
        labelQPost?.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        
        delegate?.buttonActionPassQPost(sender: buttonQPost)
    
    }
    
    @IBAction func buttonActionCollectfromCounter(sender: UIButton) {
        setdisable()
        imageInCollectFromCounter?.image = UIImage(named: "selectedDeliveryImg")
        viewInCollectFromCounter?.backgroundColor = .white
        labelCollectFromCounter?.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        
        delegate?.buttonActionPassCollectfromCounter(sender: buttonCollectfromCounter)
    }
    
    
}

extension DeliveryModeTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardRecipientArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModelInCardRecipient = cardRecipientArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModelInCardRecipient.identifier, for: indexPath) as! CradRecipientTableViewCell
        cell.cellModelInCardRecipient = cellModelInCardRecipient
        cell.delegate = self
        return cell
    }
    
}


extension DeliveryModeTableViewCell: CradRecipientToTableViewCellDelegate {

    func didChangeCradRecipientTextFieldText(_ text: String, cellModel: CardRecipientTableViewCellModel) {
        print("didChangeTextFieldTextDeliveryModeCell ====> \(text)")
        
        tabelViewInCardRecipient.beginUpdates()
        if let index = cardRecipientArray.firstIndex(where: {$0.cellType == cellModel.cellType}) {
            print("index ====> \(index)")
            
            if let cell = tabelViewInCardRecipient.cellForRow(at: IndexPath(row: index, section: 0)) as? CradRecipientTableViewCell {
                if cellModel.cellType == .cardRecipientNameCell {
                    if text.isEmpty {
                        errorCard.cardRecipientName = "This is required"
                        cellModel.errorCardRecipient = errorCard
                    }
                    else {
                        errorCard.cardRecipientName = ""
                        cellModel.errorCardRecipient = errorCard
                    }
                    cell.cellModelInCardRecipient = cellModel
                }
                
                if cellModel.cellType == .cardRecipientIDCell {
                    if text.isEmpty {
                        errorCard.cardRecipientID = "This is required"
                        cellModel.errorCardRecipient = errorCard
                    }
                    else {
                        errorCard.cardRecipientID = ""
                        cellModel.errorCardRecipient = errorCard
                    }
                    cell.cellModelInCardRecipient = cellModel
                }
                
                if cellModel.cellType == .cardRecipientMobileNoCell {
                    if text.isEmpty {
                        errorCard.cardRecipientMobileNo = "This is required"
                        cellModel.errorCardRecipient = errorCard
                    }
                    else {
                        errorCard.cardRecipientMobileNo = ""
                        cellModel.errorCardRecipient = errorCard
                    }
                    cell.cellModelInCardRecipient = cellModel
                }
                
                if cellModel.cellType == .cardRecipientRelationship {
                    if text.isEmpty {
                        errorCard.cardRecipientRelationship = "This is required"
                        cellModel.errorCardRecipient = errorCard
                    }
                    else {
                        errorCard.cardRecipientRelationship = ""
                        cellModel.errorCardRecipient = errorCard
                    }
                    cell.cellModelInCardRecipient = cellModel
                }
            }
            tabelViewInCardRecipient.endUpdates()
            
        }
        delegate?.didChangeCardRecipientVCTableTextFieldText(text, cellModel: cellModel)
    }
    
}


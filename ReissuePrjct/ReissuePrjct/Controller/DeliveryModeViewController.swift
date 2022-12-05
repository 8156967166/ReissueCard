//
//  DeliveryModeViewController.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

protocol DeliveryModeViewControllerToBaseDelegate {
    func didChangeDeliveryModeVcTextFieldText(_ text:String, cellModel:CardRecipientTableViewCellModel)
    func passCellModel(cellModelInDeliveryMode: DeliveryModeTableViewcellModel)
}

class DeliveryModeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    var delegate: DeliveryModeViewControllerToBaseDelegate?
    var isSelectbutton = Bool()
    var deliveryModelArray:[DeliveryModeTableViewcellModel] = []
    var card:ReissueCard = ReissueCard([:])
    var errorCard:ReissueCard = ReissueCard([:])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDeliveryModeModel()
        // Do any additional setup after loading the view.
    }
    
    func setDeliveryModeModel() {
        
        deliveryModelArray = []
        let deliveryMode = DeliveryModeTableViewcellModel(strtitle: "Delivery Mode", celltype: .deliveryModecell)
        let requiredFee = DeliveryModeTableViewcellModel(strtitle: "Required Fees", celltype: .requiredFeeCell)
        let cardrecipient = DeliveryModeTableViewcellModel(strtitle: "", celltype: .collectFromCounterCell)
        deliveryModelArray.append(deliveryMode)
        deliveryModelArray.append(cardrecipient)
        deliveryModelArray.append(requiredFee)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension DeliveryModeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveryModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModelInDeliveryMode = deliveryModelArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModelInDeliveryMode.identifier, for: indexPath) as! DeliveryModeTableViewCell
        cell.card = card
        cell.errorCard = errorCard
        cell.cellModelInDeliveryMode = cellModelInDeliveryMode
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellModelInDeliveryMode = deliveryModelArray[indexPath.row]
//        delegate?.passButtonClickDeliveryMode(isSelectButton: isSelectbutton)
        
    
        if cellModelInDeliveryMode.isSelected == true {
            if cellModelInDeliveryMode.cellType == .collectFromCounterCell {
                return 500
            }
        }
        else {
            if cellModelInDeliveryMode.cellType == .collectFromCounterCell {
                return 0
            }
        }
        return tableView.rowHeight
    }
}

extension DeliveryModeViewController: DeliveryModeTableViewCellDelegate {
    
    func buttonActionPassQPost(sender: UIButton) {
        for model in deliveryModelArray {
            model.isSelected = false
            delegate?.passCellModel(cellModelInDeliveryMode: model)
        }
        tableView.reloadData()
        print("QPost clicked")
       
    }
    
    func buttonActionPassCollectfromCounter(sender: UIButton) {
        for model in deliveryModelArray {
            model.isSelected = true
            delegate?.passCellModel(cellModelInDeliveryMode: model)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func didChangeCardRecipientVCTableTextFieldText(_ text: String, cellModel: CardRecipientTableViewCellModel) {
        delegate?.didChangeDeliveryModeVcTextFieldText(text, cellModel: cellModel)
    }
}

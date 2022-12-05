//
//  PersonalDetailViewController.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

protocol PersonalDetailViewControllerDelegate {
    func didChangePersonalDetailVCTableTextFieldText(_ text:String, cellModel:PersonalDetailTableViewCellModel)
    func didChangePersonalDetailVCTableLabelText(_ label:String, cellModel:PersonalDetailTableViewCellModel)
}

class PersonalDetailViewController: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
     
    //MARK: - variable
    
    var delegate: PersonalDetailViewControllerDelegate?
    var personaldetailArry:[PersonalDetailTableViewCellModel] = []
    var card:ReissueCard = ReissueCard([:])
    var errorCard:ReissueCard = ReissueCard([:])
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        errorCard.requestNumber = ""
//        errorCard.familyNumber = ""
//        errorCard.familyType = ""
        setPersonaldetailModel()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Function
    
    func setPersonaldetailModel() {
        personaldetailArry = []
        let familyNumber = PersonalDetailTableViewCellModel(strtitle: "Family Number", celltype: .familyNumberCell, errorCard)
        let tamwinCardNumber = PersonalDetailTableViewCellModel(strtitle: "Tamwin Card Number", celltype: .TamwinCardNumberCell, errorCard)
        let requestNumber = PersonalDetailTableViewCellModel(strtitle: "Request Number*", celltype: .requestNumberCell, errorCard)
        let familyType = PersonalDetailTableViewCellModel(strtitle: "Family Type", celltype: .familyTypeCell, errorCard)
        personaldetailArry.append(familyNumber)
        personaldetailArry.append(tamwinCardNumber)
        personaldetailArry.append(requestNumber)
        personaldetailArry.append(familyType)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

//MARK: - Table

extension PersonalDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personaldetailArry.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = personaldetailArry[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier) as! PersonalDetailTableViewCell
        cell.cellModel = cellModel
        cell.delegate = self
        return cell
    }

}

//MARK: - TextFieldDelegateFromCell

extension PersonalDetailViewController: PersonalDetailTableViewCellDelegate {
    
//    func passTextFieldPersonaldetail(strtextFieldEnter: String, passModel: PersonalDetailTableViewCellModel) {
//        for model in personaldetailArry {
//            if model.cellType == passModel.cellType {
//                model.enteredTextFieldPersonalDetail = strtextFieldEnter
//            }
//        }
//    }
    
   
    func didChangePersonDetailVCTableTextFieldText(_ text: String, cellModel: PersonalDetailTableViewCellModel) {
        print("didChangeTextFieldText ====> \(text)")
        for model in personaldetailArry {
            if model.cellType == cellModel.cellType {
                model.enteredTextFieldPersonalDetail = text
            }
        }
        tableView.beginUpdates()
        if let index = personaldetailArry.firstIndex(where: {$0.cellType == cellModel.cellType}) {
            print("index ====> \(index)")
            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? PersonalDetailTableViewCell {
                if cellModel.cellType == .requestNumberCell {
                    if text.isEmpty {
                        errorCard.requestNumber = "This is required"
                        cellModel.errorCard = errorCard
                    }
                    else {
                        errorCard.requestNumber = ""
                        cellModel.errorCard = errorCard
                    }
                    cell.cellModel = cellModel
                }
            }
            tableView.endUpdates()
        }
        
        self.delegate?.didChangePersonalDetailVCTableTextFieldText(text, cellModel: cellModel)
    }
    
    func didChangePersonDetailVcTableLabeltext(_ label: String, cellModel: PersonalDetailTableViewCellModel) {
        print("didChangeLabelText ====> \(label)")
        
        tableView.beginUpdates()
        if let index = personaldetailArry.firstIndex(where: {$0.cellType == cellModel.cellType}) {
            print("index ====> \(index)")
            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? PersonalDetailTableViewCell {
                if cellModel.cellType == .TamwinCardNumberCell {
                    if label == "Select" {
                        print("not selected tamwin card")
                        errorCard.tamwinCard = "This is required"
                        cellModel.errorCard = errorCard
                    }
                    else {
                        errorCard.tamwinCard = ""
                        cellModel.errorCard = errorCard
                    }
                    cell.cellModel = cellModel
                }
            }
            tableView.endUpdates()
        }
        self.delegate?.didChangePersonalDetailVCTableLabelText(label, cellModel: cellModel)
        
    }
    
    func buttonActionTamwinCardSelect(sender: UIButton) {
        for model in personaldetailArry {
            if model.cellType == .TamwinCardNumberCell {
                if model.isSelected == true {
                    model.isSelected = false
                } else {
                    model.isSelected = true
                }
            }
        }
        tableView.reloadData()
    }
    
}

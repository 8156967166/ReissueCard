//
//  ReasonViewController.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

protocol ReasonViewControllerToBaseDelegate {
    func didChangeLabelText(_ label:String, cellModel:ReasonTableViewCellModel)
    func didChangeTextFieldText(_ text:String, cellModel:ReasonTableViewCellModel)
    
}

class ReasonViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ReasonViewControllerToBaseDelegate?
    var reasonArray:[ReasonTableViewCellModel] = []
    var card:ReissueCard = ReissueCard([:])
    var errorCard:ReissueCard = ReissueCard([:])
    var setImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setreasonModel()
        // Do any additional setup after loading the view.
    }
    
    func setreasonModel() {
        reasonArray = []
        let reason = ReasonTableViewCellModel(strtitle: "Reason*", celltype: .reasonCell, errorCard)
        let document = ReasonTableViewCellModel(strtitle: "Document Type*", celltype: .documentCell, errorCard)
        let remark = ReasonTableViewCellModel(strtitle: "Reason Remarks", celltype: .remarkCell, errorCard)
        let image = ReasonTableViewCellModel(strtitle: "Image Attachment", celltype: .imageCell, errorCard)
        let imageSize = ReasonTableViewCellModel(strtitle: "5 MB Max for 1 file ,Jpeg, Png", celltype: .imageSizeCell, errorCard)
        reasonArray.append(reason)
        reasonArray.append(remark)
        reasonArray.append(document)
        reasonArray.append(image)
        reasonArray.append(imageSize)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    func showAlert() {
        let alertController = UIAlertController(title: "", message: "Choose Any Option", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(_ action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alertController.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {(_ action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerConroller = UIImagePickerController()
            imagePickerConroller.delegate = self
            imagePickerConroller.sourceType = sourceType
            self.present(imagePickerConroller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true) { [weak self] in
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
//               self?.profileImage.image = image
            self?.setImage = image
            for model in self?.reasonArray ?? [] {
                if model.cellType == .imageCell {
                    model.isSelectImage = true
                }
            }
            
//            self?.heightFromImageAttachment?.constant = 37.5
            print("imge ===== \(self?.setImage)")
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
    }

}

extension ReasonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModelInReason = reasonArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModelInReason.identifier) as! ReasonTableViewCell
        if cellModelInReason.cellType == .imageCell {
//            cell.heightInImageAttachmentView?.constant = 0
            cell.imageViewImageAttachment?.image = self.setImage
        }
        
        if cellModelInReason.isSelectImage == true {
            cell.heightInImageAttachView?.constant = 37.5
        }
        else {
            cell.heightInImageAttachView?.constant = 0
        }
        
        cell.cellModelInReason = cellModelInReason
        cell.delegate = self
        return cell
    }
}

extension ReasonViewController: ReasonTableViewCellDelegate {
    
    func buttonActionReasonSelect(sender: UIButton) {
        for model in reasonArray {
            if model.cellType == .reasonCell {
                if model.isSelected == true {
                    model.isSelected = false
                } else {
                    model.isSelected = true
                }
            }
        }
        tableView.reloadData()
    }
    
    func buttonActionDocumentSelect(sender: UIButton) {
        for model in reasonArray {
            if model.cellType == .documentCell {
                if model.isSelectDoc == true {
                    model.isSelectDoc = false
                } else {
                    model.isSelectDoc = true
                }
            }
        }
        tableView.reloadData()
    }
    
    
    func buttonActionImageAttachment(sender: UIButton) {
        showAlert()
    }
    
    func didChangeReasonVCTableLabelText(_ label: String, cellModel: ReasonTableViewCellModel) {
        print("didChangeVcLabelText ====> \(label)")
        
//        for model in reasonArray {
//            if model.cellType == cellModel.cellType {
//                model.enteredTextFieldReason = label
//            }
//        }
        tableView.beginUpdates()
        if let index = reasonArray.firstIndex(where: {$0.cellType == cellModel.cellType}) {
            print("index ====> \(index)")
            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? ReasonTableViewCell {
                if cellModel.cellType == .reasonCell {
                    if label == "Select" {
                        errorCard.reason = "This is required"
                        cellModel.errorCard = errorCard
                    }
                    else {
                        errorCard.reason = ""
                        cellModel.errorCard = errorCard
                    }
                    cell.cellModelInReason = cellModel
                }
                if cellModel.cellType == .documentCell {
                    if label == "Select" {
                        errorCard.document = "This is required"
                        cellModel.errorCard = errorCard
                    }
                    else {
                        errorCard.document = ""
                        cellModel.errorCard = errorCard
                    }
                    cell.cellModelInReason = cellModel
                }
            }
            tableView.endUpdates()

        }
        
        self.delegate?.didChangeLabelText(label, cellModel: cellModel)
    }
    
    func didChangeDocumentVcTextFieldText(_ text: String, cellModel: ReasonTableViewCellModel) {
        print("didChangeVcTextFieldRemarkText ====> \(text)")
        self.delegate?.didChangeTextFieldText(text, cellModel: cellModel)
    }
    
}

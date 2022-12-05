//
//  BaseViewController.swift
//  ReissuePrjct
//
//  Created by Bimal@AppStation on 20/10/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var viewExit: UIView!
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var labelPersonalDetail: UILabel!
    @IBOutlet weak var labelReason: UILabel!
    @IBOutlet weak var labelDeliveryMode: UILabel!
    @IBOutlet weak var viewInPersonalDetailNumber: UIView!
    @IBOutlet weak var viewInReasonNumber: UIView!
    @IBOutlet weak var viewInDeliveryModeNumber: UIView!
    @IBOutlet weak var viewInPersonalDetail: UIView!
    @IBOutlet weak var viewInReason: UIView!
    @IBOutlet weak var viewInDeliveryMode: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewInScroll: UIView!
    @IBOutlet weak var buttonPersonalDetail: UIButton!
    @IBOutlet weak var buttonReason: UIButton!
    @IBOutlet weak var buttonDeliveryMode: UIButton!
    @IBOutlet weak var labelInPrevious: UILabel!
    @IBOutlet weak var labelInNext: UILabel!
    @IBOutlet weak var viewInPrevious: UIView!
    @IBOutlet weak var viewInNext: UIView!
    @IBOutlet weak var imageViewInPersonalDetail: UIImageView!
    @IBOutlet weak var labelPersonalDetailNumber: UILabel!
    @IBOutlet weak var imageViewInReason: UIImageView!
    @IBOutlet weak var labelReasonNumber: UILabel!
    @IBOutlet weak var imageViewInDeliveryMode: UIImageView!
    @IBOutlet weak var labelDeliveryModeNumber: UILabel!
    
    //MARK: - Variable
    
    var reissueCard: ReissueCard = ReissueCard([:])
    var errorCard:ReissueCard = ReissueCard([:])
    var isSelectButtonInDeliveryMode = Bool()
    var personalDetailViewController: PersonalDetailViewController?
    var reasonViewController: ReasonViewController?
    var deliveryModeViewController: DeliveryModeViewController?
    var cellModelInDelivery: DeliveryModeTableViewcellModel?
    var selectedTab = 2
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let personalDetailVc = segue.destination as? PersonalDetailViewController {
            personalDetailVc.delegate = self
            personalDetailVc.card = reissueCard
            personalDetailVc.errorCard = errorCard
            personalDetailViewController = personalDetailVc
        }
        else if let reasonVC = segue.destination as? ReasonViewController {
            reasonVC.delegate = self
            reasonVC.card = reissueCard
            reasonVC.errorCard = errorCard
            reasonViewController = reasonVC
        }
        else if let deliveryModeVC = segue.destination as? DeliveryModeViewController {
            deliveryModeVC.delegate = self
            deliveryModeVC.card = reissueCard
            deliveryModeVC.errorCard = errorCard
            deliveryModeViewController = deliveryModeVC
        }
        
    }
    
    func setdisable() {
        labelPersonalDetail.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelReason.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelDeliveryMode.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewInPersonalDetailNumber.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        viewInReasonNumber.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        viewInDeliveryModeNumber.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        viewInReason.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        viewInDeliveryMode.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
    }
    
    func setViewColor() {
        viewInPrevious.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewInNext.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        labelInPrevious.textColor = #colorLiteral(red: 0, green: 0.6950383782, blue: 0.9160410762, alpha: 1)
        labelInNext.textColor = #colorLiteral(red: 0, green: 0.6950383782, blue: 0.9160410762, alpha: 1)
    }
    
    @IBAction func buttonActionPrevious(sender: UIButton) {
      
        setViewColor()
        labelInPrevious.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewInPrevious.backgroundColor = #colorLiteral(red: 0, green: 0.6950383782, blue: 0.9160410762, alpha: 1)

        if scrollView.contentOffset.x == 0 {
        }
        else if scrollView.contentOffset.x == viewInScroll.bounds.width {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            buttonActionPersonalDetail(sender: buttonPersonalDetail)
            selectedTab = selectedTab - 1
           
        }
        else {
            scrollView.setContentOffset(CGPoint(x: viewInScroll.bounds.width, y: 0), animated: true)
            buttonActionReason(sender: buttonReason)
            selectedTab = selectedTab - 1
        }
    
    }
    
    @IBAction func buttonActionNext(sender: UIButton) {
        deliveryMode()
        
        print("Family Number: \(reissueCard.familyNumber)")
        print("Tamwin Card Number: \(reissueCard.tamwinCard) ")
        print("Request NUmber: \(reissueCard.requestNumber)")
        print("Family Type: \(reissueCard.familyType)")
        print("Reason DropDown: \(reissueCard.reason)")
        print("Reason Remarks: \(reissueCard.remark)")
        print("Document Type: \(reissueCard.document) ")
        print("Card Recipient Name: \(reissueCard.cardRecipientName)")
        print("Card Recipient ID: \(reissueCard.cardRecipientID)")
        print("Card Recipient MobileNo: \(reissueCard.cardRecipientMobileNo)")
        print("Card Recipient Relationship: \(reissueCard.cardRecipientRelationship)")
        
        setViewColor()
        labelInNext.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewInNext.backgroundColor = #colorLiteral(red: 0, green: 0.6950383782, blue: 0.9160410762, alpha: 1)
        
        if scrollView.contentOffset.x == 0 {
            
            if reissueCard.requestNumber.isEmpty {
                errorCard.requestNumber = "This is required"
                print("request number empty")
            }
            else {
                errorCard.requestNumber = ""
                print("request number not empty")
                scrollView.setContentOffset(CGPoint(x: viewInScroll.bounds.width, y: 0), animated: true)
                buttonActionReason(sender: buttonReason)
                selectedTab = selectedTab + 1
            }
            
            personalDetailViewController?.errorCard = errorCard
            personalDetailViewController?.tableView.reloadData()

        }
        
        else if scrollView.contentOffset.x == viewInScroll.bounds.width {
            if (reissueCard.reason == "Select") || (reissueCard.document == "Select") {
                errorCard.reason = "This is required"
                errorCard.document = "This is required"
                print("reason DropDown empty")
            }
            else {
                errorCard.reason = ""
                errorCard.document = ""
                print("reason DropDown not empty")
                scrollView.setContentOffset(CGPoint(x: 2*(viewInScroll.bounds.width), y: 0), animated: true)
                buttonActionDeliveryMode(sender: buttonDeliveryMode)
                selectedTab = selectedTab + 1
    
            }
            
            reasonViewController?.errorCard = errorCard
            reasonViewController?.tableView.reloadData()
        }
        deliveryModeViewController?.errorCard = errorCard
        deliveryModeViewController?.tableView.reloadData()
    }
    
    func personalDetailValidate() {
        if ((reissueCard.familyNumber.isEmpty) || (reissueCard.familyType.isEmpty)) || (reissueCard.tamwinCard.isEmpty) {
             
            print("empty")
            labelPersonalDetailNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            viewInPersonalDetail.backgroundColor =  #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
            imageViewInPersonalDetail.image = UIImage(systemName: "profile")
            
        }
        else {
            imageViewInPersonalDetail.image = UIImage(named: "checkcircleImg")
            labelPersonalDetailNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
            labelPersonalDetail.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
            print("not empty")

        }
        personalDetailViewController?.tableView.reloadData()
    }
    
    func reasonValidate() {
        if reissueCard.reason == "Select" || reissueCard.document == "Select" || reissueCard.remark.isEmpty {
            labelReasonNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            imageViewInReason.image = UIImage(systemName: "profile")
        }
        else {
            imageViewInReason.image = UIImage(named: "checkcircleImg")
            labelReasonNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            viewInReason.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
            labelReason.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
            if (reissueCard.familyNumber.isEmpty || reissueCard.familyType.isEmpty) || (reissueCard.tamwinCard.isEmpty){
                viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
            }
            else {
              viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
            }
           
            print("reason not empty")
        }
        reasonViewController?.tableView.reloadData()
    }
    
    func deliveryMode() {
        if cellModelInDelivery?.isSelected == false {
            viewInDeliveryMode.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
            labelDeliveryModeNumber.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            imageViewInDeliveryMode.image = UIImage(named: "checkcircleImg")
        }
        if cellModelInDelivery?.isSelected == true {
            viewInDeliveryMode.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
            labelDeliveryModeNumber.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            imageViewInDeliveryMode.image = UIImage(systemName: "profile")
           
            if (reissueCard.cardRecipientName.isEmpty == false) && (reissueCard.cardRecipientID.isEmpty == false) && (reissueCard.cardRecipientMobileNo.isEmpty == false) && (reissueCard.cardRecipientRelationship.isEmpty == false) {
                viewInDeliveryMode.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                labelDeliveryModeNumber.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                labelDeliveryMode.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                imageViewInDeliveryMode.image = UIImage(named: "checkcircleImg")
            }
        }
    }
    
    @IBAction func buttonActionPersonalDetail(sender: UIButton) {
        viewExit.isHidden = true
        viewInfo.isHidden = false
        selectedTab = 0
        setdisable()
        labelPersonalDetail.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        viewInPersonalDetailNumber.layer.borderColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        reasonValidate()
        personalDetailValidate()
        
        deliveryMode()
    }
    
    @IBAction func buttonActionReason(sender: UIButton) {
    
        if reissueCard.requestNumber.isEmpty {
            errorCard.requestNumber = "This is required"
            print("request number empty")
        }
        
        else {
            setdisable()
            viewExit.isHidden = false
            viewInfo.isHidden = true
            selectedTab = 1
//            setdisable()
            labelReason.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
            viewInReasonNumber.layer.borderColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
            viewInReason.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
            scrollView.setContentOffset(CGPoint(x: viewInScroll.bounds.width, y: 0), animated: true)
            
            
            if reissueCard.reason == "Select" || reissueCard.document == "Select" || reissueCard.remark.isEmpty {
                labelReasonNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                imageViewInReason.image = UIImage(systemName: "profile")
            }
            else {
                imageViewInReason.image = UIImage(named: "checkcircleImg")
                labelReasonNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                viewInReason.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                labelReason.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                deliveryMode()
                print("reason not empty")
            }
            personalDetailValidate()
        }
        reasonViewController?.tableView.reloadData()
        
        personalDetailViewController?.errorCard = errorCard
        personalDetailViewController?.tableView.reloadData()
        
    }
    
    @IBAction func buttonActionDeliveryMode(sender: UIButton) {
        if reissueCard.requestNumber.isEmpty {
            errorCard.requestNumber = "This is required"
        
        }
        
        else {
            setdisable()
        
            personalDetailValidate()
            if reissueCard.reason == "Select" || reissueCard.document == "Select"{
                errorCard.reason = "This is required"
                errorCard.document = "This is required"
                print("Reason dropDown & document dropDown is empty")
            }
            else {
                errorCard.reason = ""
                errorCard.document = ""
                if reissueCard.reason == "Select" || reissueCard.document == "Select" || reissueCard.remark.isEmpty {
                    labelReasonNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    imageViewInReason.image = UIImage(systemName: "profile")
                }
                else {
                    imageViewInReason.image = UIImage(named: "checkcircleImg")
                    labelReasonNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                    viewInReason.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                    viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                    labelPersonalDetail.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                    labelReason.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                    print("reason not empty")
                }
                
                viewExit.isHidden = false
                viewInfo.isHidden = true
                selectedTab = 2
                labelDeliveryMode.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                viewInDeliveryModeNumber.layer.borderColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
                viewInDeliveryMode.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
                scrollView.setContentOffset(CGPoint(x: 2*(viewInScroll.bounds.width), y: 0), animated: true)
                
                deliveryMode()
               
            }
            personalDetailValidate()
           
    //        let screenSize: CGRect = UIScreen.main.bounds
        
        }
        
        deliveryModeViewController?.errorCard = errorCard
        deliveryModeViewController?.tableView.reloadData()
        
        personalDetailViewController?.errorCard = errorCard
        personalDetailViewController?.tableView.reloadData()
        
        reasonViewController?.errorCard = errorCard
        reasonViewController?.tableView.reloadData()
        
    }

}


//MARK: - textFieldDelegate

extension BaseViewController: PersonalDetailViewControllerDelegate {
    
    func didChangePersonalDetailVCTableLabelText(_ label: String, cellModel: PersonalDetailTableViewCellModel) {
        print("Base VC :: didChangePersonalDetailLabelText ====> \(label) || \(cellModel.cellType)")
        
        if cellModel.cellType == .TamwinCardNumberCell {
            reissueCard.tamwinCard = label
        }
    }
    
    func didChangePersonalDetailVCTableTextFieldText(_ text: String, cellModel: PersonalDetailTableViewCellModel) {
        print("Base VC :: didChangePersonalDetailTextFieldText ====> \(text) || \(cellModel.cellType)")
        
        if cellModel.cellType == .familyNumberCell {
            reissueCard.familyNumber = text
        }
        else if cellModel.cellType == .familyTypeCell {
            reissueCard.familyType = text
        }
        else {
            reissueCard.requestNumber = text
        }
    }

}


extension BaseViewController: DeliveryModeViewControllerToBaseDelegate {
    func passCellModel(cellModelInDeliveryMode: DeliveryModeTableViewcellModel) {
        cellModelInDelivery = cellModelInDeliveryMode
        buttonActionDeliveryMode(sender: buttonDeliveryMode)
    }
    
    
    func didChangeDeliveryModeVcTextFieldText(_ text: String, cellModel: CardRecipientTableViewCellModel) {
        print("Base VC :: didChangeDeliveryModeVCTableTextFieldText ====> \(text) || \(cellModel.cellType)")
        
        switch cellModel.cellType {
        case .cardRecipientNameCell:
            reissueCard.cardRecipientName = text
        case .cardRecipientIDCell:
            reissueCard.cardRecipientID = text
        case .cardRecipientMobileNoCell:
            reissueCard.cardRecipientMobileNo = text
        case .cardRecipientRelationship:
            reissueCard.cardRecipientRelationship = text
        }
        
    }
}

extension BaseViewController: ReasonViewControllerToBaseDelegate {
    
    func didChangeLabelText(_ label: String, cellModel: ReasonTableViewCellModel) {
        print("Base VC :: didChangeReasonVCTableLabelText ====> \(label) || \(cellModel.cellType)")
        
        switch cellModel.cellType {
        case .reasonCell:
            reissueCard.reason = label
        case .documentCell:
            reissueCard.document = label
        case .remarkCell:
            reissueCard.remark = label
        case .imageCell:
            reissueCard.image = label
        case .imageSizeCell:
            reissueCard.imageSize = label
        }
        
       if cellModel.isSelectImage == true {
            print("HIiiiiiiiiii")
       }
    }
    
    func didChangeTextFieldText(_ text: String, cellModel: ReasonTableViewCellModel) {
        print("Base VC :: didChangeReasonVCTableTextFieldText ====> \(text) || \(cellModel.cellType)")
        
        if cellModel.cellType == .remarkCell {
            reissueCard.remark = text
        }
    }
    

}

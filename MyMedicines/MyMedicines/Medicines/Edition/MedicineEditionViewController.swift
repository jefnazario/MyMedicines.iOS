//
//  MedicineEditionViewController.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 01/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

class MedicineEditionViewController: BaseTableViewController, StoryboardLoadable {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var lblCompositionCount: UILabel!
    @IBOutlet weak var txtCompositionCount: UITextField!
    
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var txtAmount: UITextField!
    
    @IBOutlet weak var lblDueDate: UILabel!
    @IBOutlet weak var txtDueDate: UITextField!
    
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var txtType: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    
    var presenter: IMedicineEditionPresenter!
    var medicineEdit: Medicine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MedicineEditionPresenter(vc: self)
        presenter.medicine = medicineEdit
        setupTextFields()
        setupButton()
    }

    func setupButton() {
        btnSave.addTarget(self, action: #selector(saveData), for: .touchUpInside)
    }
    
    @objc func saveData() {
        guard let name = txtName.text, name.count > 0,
                let composition = txtCompositionCount.text, composition.count > 0,
                let amount = txtAmount.text, amount.count > 0,
                let dueDate = txtDueDate.text, dueDate.count > 0
            else {
                debugPrint("Nenhum dado digitado")
                return
        }
        
        let medicine = Medicine()
        medicine.name = name
        medicine.compositionCount = composition
        medicine.amount = amount
        medicine.dueDate = dueDate
        medicine.drugType = txtType.text
        
        if let isEditId = presenter.medicine {
             medicine.objId = isEditId.objId
        }
        
        presenter.medicine = medicine
        presenter.save()
    }
}

extension MedicineEditionViewController: UITextFieldDelegate {
    fileprivate func setupTextFields() {
        if let medicine = medicineEdit {
            txtName.text = medicine.name
            txtCompositionCount.text = medicine.compositionCount
            txtAmount.text = medicine.amount
            txtDueDate.text = medicine.dueDate
            txtType.text = medicine.drugType
        }
        
        txtName.delegate = self
        txtCompositionCount.delegate = self
        txtAmount.delegate = self
        txtType.delegate = self
        
        txtDueDate.delegate = self
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        txtDueDate.inputView = datePickerView
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(toolbarSelect))
        txtDueDate.inputAccessoryView = toolBar
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        txtDueDate.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func toolbarSelect() {
        _ = textFieldShouldReturn(txtDueDate)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.toNext()
        return false
    }
}

extension MedicineEditionViewController: IMedicineEditionView {
    func handleRegistrationSuccess() {
        navigationController?.popViewController(animated: true)
    }
}

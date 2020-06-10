//
//  ScheduleEdition+UIElements.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 09/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

extension ScheduleEditionViewController {
    func setupUIElements() {
        // Setup a new schedule if there's not one
        if schedule == nil {
            schedule = Schedule()
        }
        
        txtMedicine.delegate = self
        setupMedicinePickerView()
        
        // Setup colored buttons
        var index = 0
        colorButtons.forEach { (btn) in
            btn.toCircle()
            btn.backgroundColor = UIColor(presenter.backgroundButtons[index])
            btn.tag = index
            btn.addTarget(self, action: #selector(colorButtonTapped(_:)), for: .touchUpInside)
            index += 1
        }
        
        // setup save button
        btnSave.addTarget(self, action: #selector(saveSchedule), for: .touchUpInside)
    }
    
    func setupMedicinePickerView() {
        medicinePickerView = UIPickerView()
        medicinePickerView.delegate = self
        medicinePickerView.dataSource = self
        txtMedicine.inputView = medicinePickerView
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(toolBarSelect), with: #selector(typeSelect))
        txtMedicine.inputAccessoryView = toolBar
    }
    
    @objc func toolBarSelect() {
        guard txtMedicine.inputView != nil else {
            setupMedicinePickerView()
            txtMedicine.resignFirstResponder()
            txtMedicine.becomeFirstResponder()
            return
        }
        
        if txtMedicine.text!.isEmpty {
            pickerView(medicinePickerView, didSelectRow: 0, inComponent: 0)
        }
        _ = textFieldShouldReturn(txtMedicine)
    }
    
    @objc func typeSelect() {
        txtMedicine.inputView = nil
        txtMedicine.resignFirstResponder()
        txtMedicine.becomeFirstResponder()
    }
}

extension ScheduleEditionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.medicines.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter.medicines[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtMedicine.text = presenter.medicines[row].name
    }
}

//
//  ScheduleEditionViewController.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 08/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

class ScheduleEditionViewController: BaseTableViewController, StoryboardLoadable {
    
    @IBOutlet weak var txtMedicine: UITextField!
    
    @IBOutlet var colorButtons: [UIButton]!
    @IBOutlet weak var btnSave: UIButton!
    
    var presenter: ISchedulesPresenter!
    var schedule: Schedule?
    var medicinePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        presenter = SchedulePresenter(vc: self)
        setupUIElements()
    }
    
    @objc func colorButtonTapped(_ sender: UIButton) {
        let bgColor = presenter.backgroundButtons[sender.tag]
        btnSave.backgroundColor = UIColor(bgColor)
        colorButtons.forEach { (btn) in
            btn.setTitle("", for: .normal)
        }
        
        sender.setTitle(defaultCheck, for: .normal)
        
        guard let item = schedule else { return }
        item.customColor = bgColor
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        btnSave.backgroundColor = UIColor.black
        colorButtons.forEach { (btn) in
            btn.setTitle("", for: .normal)
        }
        
        guard let item = schedule else { return }
        item.customColor = 0
    }
    
    @objc func saveSchedule(_ sender: UIButton) {
        print("salvando")
    }
}

extension ScheduleEditionViewController: ISchedulesView {
    
}

extension ScheduleEditionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.toNext()
        return false
    }
}

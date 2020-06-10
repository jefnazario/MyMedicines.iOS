//
//  MedicinesViewCell.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 30/06/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

let reuseIdentifierMedicine = "MedicinesViewCell"

class MedicinesViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var compositionCount: UILabel!
    @IBOutlet weak var amountDescription: UILabel!
    @IBOutlet weak var dueDateDescription: UILabel!
    @IBOutlet weak var dueDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        name.textColor = UIColor.darkText
        compositionCount.textColor = UIColor.darkGray
        amountDescription.textColor = UIColor.lightGray
    }
    
    func setup(_ medicine: Medicine) {
        name.text = medicine.name
        compositionCount.text = medicine.compositionCount
        amountDescription.text = medicine.description()
        dueDate.text = medicine.dueDate
    }
}

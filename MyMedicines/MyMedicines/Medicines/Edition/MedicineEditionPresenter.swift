//
//  MedicineEditionPresenter.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 02/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

class MedicineEditionPresenter: IMedicineEditionPresenter {
    fileprivate var repo: Repository<Medicine>!
    fileprivate var viewController: IMedicineEditionView!
    var medicine: Medicine?
    
    init(vc: IMedicineEditionView) {
        repo = Repository<Medicine>()
        viewController = vc
    }
    
    func save() {
        guard let medicine = self.medicine else { return }
        
        if let _ = medicine.objId {
            repo.update(medicine)
        } else {
            medicine.objId = UUID.init().uuidString
            repo.add(medicine)
        }
        
        viewController.handleRegistrationSuccess()
    }
}

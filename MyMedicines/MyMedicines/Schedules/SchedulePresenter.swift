//
//  SchedulePresenter.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 08/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

let defaultCheck = "✔︎"

class SchedulePresenter: ISchedulesPresenter {
    var backgroundButtons: [Int] = []
    
    var viewController: ISchedulesView!
    var medicines: [Medicine] = []
    fileprivate let repoMedicine: Repository<Medicine>!
    
    required init(vc: ISchedulesView) {
        viewController = vc
        repoMedicine = Repository<Medicine>()
        backgroundButtons = BackgroundButtons.bgs
        
        loadMedicines()
    }
    
    func loadMedicines() {
        repoMedicine.getAll { (medicines) in
            self.medicines = medicines
        }
    }
}

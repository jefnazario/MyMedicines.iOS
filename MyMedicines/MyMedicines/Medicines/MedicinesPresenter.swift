//
//  MedicinesPresenter.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 30/06/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

class MedicinesPresenter: IMedicinePresenter {
    var medicines: [Medicine]!
    var viewController: IMedicinesView
    var repo: Repository<Medicine>!
    
    required init(viewController: IMedicinesView) {
        repo = Repository<Medicine>()
        self.viewController = viewController
    }
    
    func addMedicine(_ name: String) {
        viewController.showDetail(with: nil)
    }
    
    func getItem(at indexPath: IndexPath) -> Medicine {
        return medicines[indexPath.row]
    }
    
    func loadMedicines() {
        medicines = []
        
        repo.getAll { [weak self] (items) in
            guard items.count > 0 else {
                self?.viewController.showEmptyMessage()
                return
            }
            self?.medicines = items
            self?.viewController.reloadData()
        }
    }
    
    func delete(at indexPath: IndexPath) {
        let item = getItem(at: indexPath)
        
        repo.delete(item)
        loadMedicines()
    }
}

extension MedicinesPresenter {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return medicines.count
    }
}

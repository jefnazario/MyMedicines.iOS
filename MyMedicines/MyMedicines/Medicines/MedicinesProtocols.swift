//
//  MedicinesProtocols.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 30/06/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

protocol IMedicinesView {
    func reloadData()
    func showDetail(with item: Medicine?)
    func showEmptyMessage()
}

protocol IMedicinePresenter: ITableViewProtocol {
    var viewController: IMedicinesView { get }
    func addMedicine(_ name: String)
    func getItem(at indexPath: IndexPath) -> Medicine
    func loadMedicines()
    func delete(at indexPath: IndexPath)
}

protocol ITableViewProtocol {
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
}

protocol IMedicineEditionPresenter {
    var medicine: Medicine? { get set }
    func save()
}

protocol IMedicineEditionView {
    func handleRegistrationSuccess()
}

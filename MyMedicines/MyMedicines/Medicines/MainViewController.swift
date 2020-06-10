//
//  ViewController.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 30/06/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: IMedicinePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MedicinesPresenter(viewController: self)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.loadMedicines()
    }
    
    @IBAction func addNewMedicine(_ sender: UIBarButtonItem) {
        presenter.addMedicine(String(format: "%@", Date() as CVarArg))
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierMedicine, for: indexPath) as! MedicinesViewCell
        let item = presenter.getItem(at: indexPath)
        
        cell.setup(item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.delete(at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = presenter.getItem(at: indexPath)
        
        showDetail(with: item)
    }
}

extension MainViewController: IMedicinesView {
    func reloadData() {
        tableView.backgroundView = nil
        tableView.reloadData()
    }
    
    func showDetail(with item: Medicine? = nil) {
        let vc = UIStoryboard.loadViewController() as MedicineEditionViewController
        
        if let medicine = item {
            vc.medicineEdit = medicine
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showEmptyMessage() {
        tableView.backgroundView = UILabel.emptyMessage()
        tableView.reloadData()
    }
}

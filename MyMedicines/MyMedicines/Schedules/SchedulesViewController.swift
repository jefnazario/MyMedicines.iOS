//
//  SchedulesViewController.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 08/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

class SchedulesViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        presenter.loadMedicines()
    }
    
    @IBAction func addSchedule() {
        let vc = UIStoryboard.loadViewController() as ScheduleEditionViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

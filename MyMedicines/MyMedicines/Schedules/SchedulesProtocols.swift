//
//  SchedulesProtocols.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 08/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

protocol ISchedulesPresenter {
    var backgroundButtons: [Int] { get }
    var medicines: [Medicine] { get }
}

protocol ISchedulesView {
    
}

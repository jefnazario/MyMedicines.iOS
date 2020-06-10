//
//  Medicine.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 30/06/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

class Medicine: IDomain {
    
    @objc dynamic var picture: String?
    @objc dynamic var name = ""
    @objc dynamic var compositionCount = ""
    @objc dynamic var amount = ""
    @objc dynamic var amountType = ""
    @objc dynamic var dueDate, drugType, updatedAt: String?
    
    func description() -> String {
        return String(format: "%@ %@", amount, amountType)
    }
    
    func dueDateObj() -> Date? {
        guard let due = dueDate else { return nil }
        
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        
        return df.date(from: due)
    }
}

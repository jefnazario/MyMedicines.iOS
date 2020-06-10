//
//  IDomain.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 01/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import RealmSwift

class IDomain: Object {
    @objc dynamic var objId: String?
    
    override static func primaryKey() -> String? {
        return "objId"
    }
}

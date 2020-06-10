//
//  Repository.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 02/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import RealmSwift

class Repository<T> {
    var realm: Realm!
    
    init() {
        DispatchQueue.main.async {
            let config = Realm.Configuration(
                schemaVersion: 3,
                migrationBlock: { migration, oldSchemaVersion in
                    //
            })
            Realm.Configuration.defaultConfiguration = config
            
            self.realm = try! Realm()
        }
    }
    
    func add(_ item: T) {
        try! realm.write {
            realm.add(item as! Object)
        }
    }
    
    func addRange(_ items: [T]) {
        try! realm.write {
            realm.add(items as! [Object])
        }
    }
    
    func update(_ item: T) {
        try! realm.write {
            realm.add(item as! Object, update: true)
        }
    }
    
    func getAll(completion: @escaping ([T]) -> Void) {
        DispatchQueue.main.async {
            let items = self.realm.objects(T.self as! Object.Type)
            completion(items.map({ (item) -> T in
                return item as! T
            }))
        }
    }
    
    func getItem(by property: String, and value: String) -> T? {
        let items = realm.objects(T.self as! Object.Type).filter("\(property) = '\(value)'")
        return items.map({ (item) -> T in
            return item as! T
        }).first
    }
    
    func delete(_ item: T) {
        try! realm.write {
            realm.delete(item as! Object)
        }
    }
    
    func deleteRange(_ items: [T]) {
        try! realm.write {
            realm.delete(items as! [Object])
        }
    }
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}

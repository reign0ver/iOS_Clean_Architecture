//
//  BaseLocalDataSource.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import Foundation
import RealmSwift

class BaseLocalDataSource<T: Object> {
    
    private var realm: Realm!
    
    init() {
        initializeRealm()
    }
    
    private func initializeRealm() {
        do {
            realm = try Realm()
        } catch {
            print("Error while initializing Realm -> \(error.localizedDescription)")
        }
    }
    
    func insert(_ object: T) throws {
        do {
            try realm.write { realm.add(object) }
        } catch {
            throw NetworkError.genericError
        }
    }
    
    func findAll() -> Results<T> {
        return realm.objects(T.self)
    }
}

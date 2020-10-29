//
//  Vote.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation
import RealmSwift

class VoteEntity: Object {
    @objc
    dynamic var name: String = ""
    
    @objc
    dynamic var date: Date = Date()
    
    @objc
    dynamic var imageURL: String = ""
    
    @objc
    dynamic var vote: String = ""
}

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
    
    convenience init(
        name: String? = "",
        date: Date? = Date(),
        imageURL: String? = "",
        vote: String? = ""
    ) {
        self.init()
        self.name = name!
        self.date = date!
        self.imageURL = imageURL!
        self.vote = vote!
    }
}

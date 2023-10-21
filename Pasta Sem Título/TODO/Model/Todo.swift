//
//  Todo.swift
//  TODO
//
//  Created by Lucas da Silva Reis on 18/10/23.
//

import Foundation
import RealmSwift

class Todo: Object {
    @Persisted(primaryKey: true) var id: ObjectId = ObjectId.generate()
    @Persisted var title: String
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

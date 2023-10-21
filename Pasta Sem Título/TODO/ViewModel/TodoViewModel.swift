//
//  TodoViewModel.swift
//  TODO
//
//  Created by Lucas da Silva Reis on 18/10/23.
//

import Foundation
import RealmSwift

class TodoViewModel {
    let realm = try! Realm()

    func createTodo(title: String, completed: Bool = false) {
        let newTodo = Todo()
        newTodo.title = title
        
        DataManager.shared.createTodo(newTodo)
    }

    func getTodos() -> Results<Todo>{
        return DataManager.shared.getTodos()
    }

    func deleteTodo(todo: Todo) {
        DataManager.shared.deleteTodo(todo)
    }
}

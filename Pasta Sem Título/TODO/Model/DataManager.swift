//
//  DataManager.swift
//  TODO
//
//  Created by Lucas da Silva Reis on 18/10/23.
//

import Foundation
import RealmSwift

class DataManager {
    static let shared = DataManager()
    
    let realm = try! Realm()
    
    func createTodo(_ todo: Todo) {
        do{
            try realm.write {
                realm.add(todo)
            }
        } catch {
            print("Erro ao criar uma nova tarefa: \(error)")
        }
    }
    
    
    func deleteTodo(_ todo: Todo) {
        do {
            try realm.write {
                realm.delete(todo)
            }
        } catch {
            print("Erro ao excluir a tarefa: \(error)")
        }
    }
    
    func getTodos() -> Results<Todo> {
        return realm.objects(Todo.self)
    }
    
}

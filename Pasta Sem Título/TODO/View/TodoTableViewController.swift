//
//  TodoTableViewController.swift
//  TODO
//
//  Created by Lucas da Silva Reis on 19/10/23.
//

import UIKit

class TodoTableViewController: UITableViewController, TodoAddDelegate {
    
    private var todoViewModel: TodoViewModel!
    var todos:[String]?

    func didAddTodo(todo: String) {
        self.todos = todoViewModel.getTodos().map {$0.title}
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.todoViewModel = TodoViewModel()
        self.todos = [String]()
        getTodos()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addTapped))

    }
    
    @objc func addTapped() {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "Details") as? TodoViewController{
            destinationVC.delegate = self
            present(destinationVC, animated: true, completion: nil)
            }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        
        let todo = self.todos?[indexPath.row]


        
        cell.titleLabel.text = todo

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //Obtendo o ojeto do banco de dados
            let todo = todoViewModel.getTodos()[indexPath.row]
            //Excui o ojeto do banco de dados
            todoViewModel.deleteTodo(todo: todo)

            tableView.beginUpdates()
            // remove o dado da matriz: todos
            todos?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

}

extension TodoTableViewController {
    //Mark: private Funcs
    private func getTodos() {
        self.todos = todoViewModel.getTodos().map {$0.title}
    }
}

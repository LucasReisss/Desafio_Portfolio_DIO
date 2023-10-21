//
//  DetailsViewController.swift
//  TODO
//
//  Created by Lucas da Silva Reis on 19/10/23.
//

import UIKit

protocol TodoAddDelegate: AnyObject {
    func didAddTodo(todo: String)
}

class TodoViewController: UIViewController {
    
    weak var delegate: TodoAddDelegate?
    let todoViewModel = TodoViewModel()
    
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margin: CGFloat = 16.0
        
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 28)
        title.text = "Agendar"
        title.textAlignment = .center
        title.sizeToFit()

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Tarefa"
        label.sizeToFit()
        
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.placeholder = "Tarefa"
        textField.layer.cornerRadius = 8.0
        textField.layer.masksToBounds = true
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Agendar", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8.0
        button.layer.masksToBounds = true
        
        
        view.addSubview(title)
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
        
        
        
        //Title
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
        //Rótulo
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        label.topAnchor.constraint(equalTo: title.topAnchor, constant: 40).isActive = true
        
        
        //Campo de texto
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 51).isActive = true
        
        //Button
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32).isActive = true
        button.heightAnchor.constraint(equalToConstant: 51).isActive = true
        
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        
    }
    
    @objc func buttonTapped() {
        let newTodo = Todo()
        
        if let text = self.textField.text {
            newTodo.title = text
        } else {
            print("Error")
        }
        
        todoViewModel.createTodo(title: newTodo.title)
        delegate?.didAddTodo(todo: newTodo.title)
        
        //Fechar a tela
        dismiss(animated: true)
    }
}


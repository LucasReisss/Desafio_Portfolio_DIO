//
//  ViewController.swift
//  TODO
//
//  Created by Lucas da Silva Reis on 18/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterButton.layer.cornerRadius = 8.0
        enterButton.layer.masksToBounds = true
    }
    
    


}


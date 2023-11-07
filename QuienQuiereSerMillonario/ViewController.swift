//
//  ViewController.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 2/11/23.
//

import UIKit

class ViewController: UIViewController {

    var userName: String = ""
  
    
    @IBOutlet weak var insertNameTextField: UITextField!
    @IBAction func nextPageButton(_ sender: UIButton) {
        insertAndSendName()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func insertAndSendName () {
        if let nameText = insertNameTextField.text {
            userName = nameText
            print("Nombre ingresado: \(userName)")
        }
    }
}



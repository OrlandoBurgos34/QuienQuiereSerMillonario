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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func nextPageButton(_ sender: UIButton) {
        let nextViewController = self.storyboard?.instantiateViewController(identifier: "ReglasViewController")
        self.navigationController?.pushViewController(nextViewController!, animated: true)
    }
    
    @IBAction func pushButton(_ sender: UIButton) {
        insertAndSendName()
        let nextPageGame = self.storyboard?.instantiateViewController(identifier: "InterfaceGameViewController")
        self.navigationController?.pushViewController(nextPageGame!, animated: true)
    }
    func insertAndSendName() {
        if let nameText = insertNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !nameText.isEmpty {
            userName = nameText
            print("Nombre ingresado: \(userName)")
        } else {
            print("Por favor, ingresa un nombre válido.")
        }
    }
}

    


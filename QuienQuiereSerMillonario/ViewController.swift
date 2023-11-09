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
        insertAndSendName()
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reglasViewController") as? ReglasViewController {
            self.present(viewController, animated: true, completion: nil)
        } else {
            print("Failed to instantiate the view controller.")
        }
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

    


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
        saveEnteredUsername()
        if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "RulesOfTheGame") as? RulesOfTheGame {
            nextViewController.userName = userName
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            print("Error: No se pudo instanciar ReglasViewController desde el storyboard.")
        }
            
            
    }
    
    @IBAction func pushButton(_ sender: UIButton) {
        saveEnteredUsername()
        if let nextPageGame = self.storyboard?.instantiateViewController(identifier: "InterfaceGameViewController") as? InterfaceGameViewController {
            nextPageGame.userName = userName
            self.navigationController?.pushViewController(nextPageGame, animated: true)
        }
    }
    func saveEnteredUsername() {
        if let nameText = insertNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !nameText.isEmpty {
            userName = nameText
            print("Nombre ingresado: \(userName)")
        } else {
            print("Por favor, ingresa un nombre válido.")
        }
    }

}

    


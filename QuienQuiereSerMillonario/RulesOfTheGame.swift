//
//  ReglasViewControlerViewController.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

class RulesOfTheGame: UIViewController {

    var userName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        TextWelcome.text = "Bienvenido \(userName)"
    }
    
    @IBAction func enterGameButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBOutlet weak var TextWelcome: UILabel!
}

//
//  ReglasViewControlerViewController.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

class RulesOfTheGame: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TextWelcome.text = "Bienvenido \(userName)"
    }
    var userName: String = ""
    @IBAction func enterGameButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBOutlet weak var TextWelcome: UILabel!
}

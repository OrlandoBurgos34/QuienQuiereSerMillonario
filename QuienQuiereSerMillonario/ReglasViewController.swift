//
//  ReglasViewControlerViewController.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

class ReglasViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var userName: String = ""
    @IBAction func enterGameButton(_ sender: UIButton) {
        if let rulesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "interfaceGameViewController") as? InterfaceGameViewController {
            self.present(rulesViewController, animated: true, completion: nil)
        } else {
            print("Failed to instantiate the view controller.")
        }
    }

}

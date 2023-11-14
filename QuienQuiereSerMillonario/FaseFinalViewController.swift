//
//  FaseFinalViewController.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

class FaseFinalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var preguntasCorrectas: [Pregunta] = []
    var preguntasIncorrectas: [Pregunta] = []
    var intentosFallidos: Int = 0
    var puntosGanados: Int = 0
    var userName: String = ""
    @IBOutlet weak var viewPointTextLabel: UILabel!
    @IBOutlet weak var acertadasLabel: UILabel!
    @IBOutlet weak var fallidasLabel: UILabel!
    @IBOutlet weak var preguntasCorrectasLabel: UILabel!
    @IBOutlet weak var preguntasIncorrectasLabel: UILabel!
    @IBAction func resetGameButton(_ sender: UIButton) {
        reiniciarJuego()
        navigationController?.popToRootViewController(animated: true)
    }
    func reiniciarJuego() {
        preguntasCorrectas = []
        preguntasIncorrectas = []
        intentosFallidos = 0
        puntosGanados = 0
    }
    func calcularPuntajeFinal() -> Int {
        var finalPoints = preguntasIncorrectas.count * 10
        if preguntasCorrectas.count == 10{
            return puntosGanados - finalPoints
        } else {
            finalPoints = preguntasCorrectas.count * 10
            return finalPoints
        }
    }
    func obtenerTextoPreguntas(_ preguntas: [Pregunta]) -> String {
        var textoPreguntas = ""
        for pregunta in preguntas {
            textoPreguntas += "\(pregunta.enunciado)\n"
        }
        return textoPreguntas
    }
}

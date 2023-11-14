//
//  FaseFinalViewController.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

class FaseFinalViewController: UIViewController {


    var preguntasCorrectas: [Question] = []
    var preguntasIncorrectas: [Question] = []
    var intentosFallidos: Int = 0
    var puntosGanados: Int = 0
    var userName: String = ""
    @IBOutlet weak var viewPointTextLabel: UILabel!
    @IBOutlet weak var acertadasLabel: UILabel!
    @IBOutlet weak var fallidasLabel: UILabel!
    @IBOutlet weak var preguntasCorrectasLabel: UILabel!
    @IBOutlet weak var preguntasIncorrectasLabel: UILabel!
    @IBAction func resetGameButton(_ sender: UIButton) {
        resetGame()
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPointTextLabel.text = "Puntos Ganados: \(calculateFinalScore())."
        acertadasLabel.text = "Preguntas Acertadas: \(preguntasCorrectas.count)"
        fallidasLabel.text = "Preguntas Fallidas: \(preguntasIncorrectas.count)"
        preguntasCorrectasLabel.text = "Preguntas Acertadas:\n\(obtenerTextoPreguntas(preguntasCorrectas))"
        preguntasIncorrectasLabel.text = "Preguntas Fallidas:\n\(obtenerTextoPreguntas(preguntasIncorrectas))"
    }
    
    func resetGame() {
        preguntasCorrectas = []
        preguntasIncorrectas = []
        intentosFallidos = 0
        puntosGanados = 0
    }
    func calculateFinalScore() -> Int {
        var finalPoints = preguntasIncorrectas.count * 10
        if preguntasCorrectas.count == 10{
            return puntosGanados - finalPoints
        } else {
            finalPoints = preguntasCorrectas.count * 10
            return finalPoints
        }
    }
    func obtenerTextoPreguntas(_ questions: [Question]) -> String {
        var textoPreguntas = ""
        for pregunta in questions {
            textoPreguntas += "\(pregunta.statement)\n"
        }
        return textoPreguntas
    }
}

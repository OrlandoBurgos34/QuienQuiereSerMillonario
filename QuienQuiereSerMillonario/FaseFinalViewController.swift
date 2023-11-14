//
//  FaseFinalViewController.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

class FaseFinalViewController: UIViewController {


    var correctQuestions: [Question] = []
    var wrongQuestions: [Question] = []
    var failedAttempts: Int = 0
    var pointsEarned: Int = 0
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
        acertadasLabel.text = "Preguntas Acertadas: \(correctQuestions.count)"
        fallidasLabel.text = "Preguntas Fallidas: \(wrongQuestions.count)"
        preguntasCorrectasLabel.text = "Preguntas Acertadas:\n\(getTextQuestions(correctQuestions))"
        preguntasIncorrectasLabel.text = "Preguntas Fallidas:\n\(getTextQuestions(wrongQuestions))"
    }
    
    func resetGame() {
        correctQuestions = []
        wrongQuestions = []
        failedAttempts = 0
        pointsEarned = 0
    }
    func calculateFinalScore() -> Int {
        var finalPoints = wrongQuestions.count * 10
        if correctQuestions.count == 10{
            return pointsEarned - finalPoints
        } else {
            finalPoints = correctQuestions.count * 10
            return finalPoints
        }
    }
    func getTextQuestions(_ questions: [Question]) -> String {
        var textQuestions = ""
        for question in questions {
            textQuestions += "\(question.statement)\n"
        }
        return textQuestions
    }
}

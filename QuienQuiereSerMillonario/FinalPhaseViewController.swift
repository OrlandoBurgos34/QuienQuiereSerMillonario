//
//  FaseFinalViewController.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

class FinalPhaseViewController: UIViewController {


    var correctQuestions: [Question] = []
    var wrongQuestions: [Question] = []
    var failedAttempts: Int = 0
    var pointsEarned: Int = 0
    var userName: String = ""
    @IBOutlet weak var viewPointTextLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var failedLabel: UILabel!
    @IBOutlet weak var correctQuestionLabel: UILabel!
    @IBOutlet weak var failedQuestionLabel: UILabel!
    @IBAction func resetGameButton(_ sender: UIButton) {
        resetGame()
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPointTextLabel.text = "Puntos Ganados: \(calculateFinalScore())."
        correctLabel.text = "Preguntas Acertadas: \(correctQuestions.count)"
        failedLabel.text = "Preguntas Fallidas: \(wrongQuestions.count)"
        correctQuestionLabel.text = "Preguntas Acertadas:\n\(getTextQuestions(correctQuestions))"
        failedQuestionLabel.text = "Preguntas Fallidas:\n\(getTextQuestions(wrongQuestions))"
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

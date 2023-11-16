//
//  InterfaceDeJuego.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

struct Question {
    var statement: String
    var responseOptions: [String]
    var correctAnswer: String

    func isCorrect(_ selectedAnswerIndex: Int) -> Bool {
        return responseOptions[selectedAnswerIndex] == correctAnswer
    }
}

class GameViewController: UIViewController {

    var questions: [Question] = [
        Question(statement: "¿Cuándo acabó la II Guerra Mundial?", responseOptions: ["1950", "1920", "1955", "1945", "1820"], correctAnswer: "1945"),
        Question(statement: "¿Cuál es el océano más grande del mundo?", responseOptions: ["océano pacifico", "océano atlantico", "océano indico", "océano marino", "océano artico"], correctAnswer: "océano pacifico"),
        Question(statement: "¿Cuántos huesos hay en el cuerpo humano?", responseOptions: ["106 huesos", "206 huesos", "100 huesos", "155 huegos", "36 huesos"], correctAnswer: "206 huesos"),
        Question(statement: "¿Quién pintó la última cena?", responseOptions: ["Pablo Picasso", "Diego Velázquez", "Salvador Dali", "Claude Monet", "Leonardo Da Vinci"], correctAnswer: "Leonardo Da Vinci"),
        Question(statement: "¿Cuántas películas de Harry Potter se han hecho?", responseOptions: ["Ocho", "Cinco", "Siete", "Nueve", "Cuatro"], correctAnswer: "Ocho"),
        Question(statement: "¿Quién escribió el Quijote?", responseOptions: ["Charles Dickens","James Joyce","Gebriel Garcia","Miguel de Cervantes","William Shakespeare"], correctAnswer: "Miguel de Cervantes"),
        Question(statement: "¿Quién es el máximo goleador de la historia del fútbol?", responseOptions: ["Pele","Maradona","Cristiano Ronaldo","Messi","Roberto Carlos"], correctAnswer: "Cristiano Ronaldo"),
        Question(statement: "¿Cuántas cuerdas tiene un violín?", responseOptions: ["Ona","Dos","Tres","Cuatro","Cinco"], correctAnswer: "Cuatro"),
        Question(statement: "¿En qué año murió Diana de Gales?", responseOptions: ["1988","1997","2000","1954","1990"], correctAnswer: "1997"),
        Question(statement: "¿En qué equipo jugó Michael Jordan la mayor parte de su carrera?", responseOptions: ["Chicago Bulls","Los Angeles Lakers","Miami Heat","Boston Celtics","Detroit Pistons"], correctAnswer: "Chicago Bulls"),
    ]
    var correctQuestions: [Question] = []
    var wrongQuestions: [Question] = []
    var failedAttempts: Int = 0
    var pointsEarned: Int = 0
    var userName: String = ""

    @IBOutlet weak var enunciadoLabel: UILabel!
    @IBOutlet weak var opcion1Button: UIButton!
    @IBOutlet weak var opcion2Button: UIButton!
    @IBOutlet weak var opcion3Button: UIButton!
    @IBOutlet weak var opcion4Button: UIButton!
    @IBOutlet weak var opcion5Button: UIButton!
    @IBOutlet weak var mensajeLabel: UILabel!

    @IBAction func answerGameLabel(_ sender: UIButton) {
        guard let index = [opcion1Button, opcion2Button, opcion3Button, opcion4Button, opcion5Button].firstIndex(of: sender) else {
                return
            }
        validateResponseAndPoints(index)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNextQuestion()
    }
    func validateResponseAndPoints(_ index: Int) {
        let numberOfPoints = 10
        let currentQuestion = questions[correctQuestions.count + wrongQuestions.count]
        let esCorrecta = currentQuestion.isCorrect(index)
        if esCorrecta {
            correctQuestions.append(currentQuestion)
            pointsEarned += numberOfPoints
            showMessage("¡Felicitaciones! Respuesta anterior correcta.")
        } else {
            wrongQuestions.append(currentQuestion)
            failedAttempts += 1
            showMessage("Respuesta anterior incorrecta. La respuesta correcta era \(currentQuestion.correctAnswer).")
        }
        showsNextQuestionIfAttemptsHaveNotRunOut()
    }
    func showsNextQuestionIfAttemptsHaveNotRunOut(){
        if validationOfFailedAttempts() {
            prepareFinalResultsViewController()
        } else {
           showNextQuestion()
        }
    }
    func showNextQuestion() {
        let indexNextQuestion = correctQuestions.count + wrongQuestions.count
            displayQuestion(questions[indexNextQuestion])
    }

    func validationOfFailedAttempts() -> Bool {
        let numAttempts = 3
        return failedAttempts >= numAttempts  || (correctQuestions.count + wrongQuestions.count) >= questions.count
    }
    func displayQuestion(_ currentQuestion: Question) {
        enunciadoLabel.text = currentQuestion.statement
        opcion1Button.setTitle(currentQuestion.responseOptions[0], for: .normal)
        opcion2Button.setTitle(currentQuestion.responseOptions[1], for: .normal)
        opcion3Button.setTitle(currentQuestion.responseOptions[2], for: .normal)
        opcion4Button.setTitle(currentQuestion.responseOptions[3], for: .normal)
        opcion5Button.setTitle(currentQuestion.responseOptions[4], for: .normal)
    }
 
    func showMessage(_ mensaje: String) {
        mensajeLabel.text = mensaje
    }
    func prepareFinalResultsViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultsViewController = storyboard.instantiateViewController(withIdentifier: "FinalPhaseViewController") as! FinalPhaseViewController
        resultsViewController.correctQuestions = correctQuestions
        resultsViewController.wrongQuestions = wrongQuestions
        resultsViewController.failedAttempts = failedAttempts
        resultsViewController.pointsEarned = pointsEarned
        navigationController?.pushViewController(resultsViewController, animated: true)
    }

}



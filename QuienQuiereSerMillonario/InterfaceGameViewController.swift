//
//  InterfaceDeJuego.swift
//  QuienQuiereSerMillonario
//
//  Created by DanielApps on 7/11/23.
//

import UIKit

struct Pregunta {
    var enunciado: String
    var opciones: [String]
    var respuestaCorrecta: String

    func isCorrect(_ selectedAnswerIndex: Int) -> Bool {
        return opciones[selectedAnswerIndex] == respuestaCorrecta
    }
}

class InterfaceGameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var userName: String = ""
    
    var questions: [Pregunta] = [
        Pregunta(enunciado: "¿Cuándo acabó la II Guerra Mundial?", opciones: ["1950", "1920", "1955", "1945", "1820"], respuestaCorrecta: "1945"),
        Pregunta(enunciado: "¿Cuál es el océano más grande del mundo?", opciones: ["océano pacifico", "océano atlantico", "océano indico", "océano marino", "océano artico"], respuestaCorrecta: "océano pacifico"),
        Pregunta(enunciado: "¿Cuántos huesos hay en el cuerpo humano?", opciones: ["106 huesos", "206 huesos", "100 huesos", "155 huegos", "36 huesos"], respuestaCorrecta: "206 huesos"),
        Pregunta(enunciado: "¿Quién pintó la última cena?", opciones: ["Pablo Picasso", "Diego Velázquez", "Salvador Dali", "Claude Monet", "Leonardo Da Vinci"], respuestaCorrecta: "Leonardo Da Vinci"),
        Pregunta(enunciado: "¿Cuántas películas de Harry Potter se han hecho?", opciones: ["Ocho", "Cinco", "Siete", "Nueve", "Cuatro"], respuestaCorrecta: "Ocho"),
        Pregunta(enunciado: "¿Quién escribió el Quijote?", opciones: ["Charles Dickens","James Joyce","Gebriel Garcia","Miguel de Cervantes","William Shakespeare"], respuestaCorrecta: "Miguel de Cervantes"),
        Pregunta(enunciado: "¿Quién es el máximo goleador de la historia del fútbol?", opciones: ["Pele","Maradona","Cristiano Ronaldo","Messi","Roberto Carlos"], respuestaCorrecta: "Cristiano Ronaldo"),
        Pregunta(enunciado: "¿Cuántas cuerdas tiene un violín?", opciones: ["Ona","Dos","Tres","Cuatro","Cinco"], respuestaCorrecta: "Cuatro"),
        Pregunta(enunciado: "¿En qué año murió Diana de Gales?", opciones: ["1988","1997","2000","1954","1990"], respuestaCorrecta: "1997"),
        Pregunta(enunciado: "¿En qué equipo jugó Michael Jordan la mayor parte de su carrera?", opciones: ["Chicago Bulls","Los Angeles Lakers","Miami Heat","Boston Celtics","Detroit Pistons"], respuestaCorrecta: "Chicago Bulls"),
    ]
    var currentQuestionIndex = 0
    var score = 0
    var remainingAttempts = 3

    @IBOutlet weak var questionGameLabel: UILabel!
    @IBOutlet weak var validationQuestion: UILabel!
    @IBOutlet var optionButtons: [UIButton]!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showQuestion()
    }

    func showQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionGameLabel.text = currentQuestion.enunciado

        for (index, button) in optionButtons.enumerated() {
            button.setTitle(currentQuestion.opciones[index], for: .normal)
            button.isEnabled = true
        }
    }

    @IBAction func answerGameLabel(_ sender: UIButton) {
        let selectedAnswerIndex = optionButtons.firstIndex(of: sender)!
        respondToQuestion(at: selectedAnswerIndex)
    }
//    func realizarPregunta() {
//        guard intentosFallidos < 3, let preguntaActual = preguntas.first else {
//            mostrarResultados()
//            return
//        }
//
//        print(preguntaActual.enunciado)
//        let opciones = ["a", "b", "c", "d", "e"]
//        for (index, opcion) in preguntaActual.opciones.enumerated() {
//            print("\(opciones[index])) \(opcion)")
//        }
//
//        print("Seleccione su respuesta (a-e): ")
//
//        if let respuesta = readLine(), let letra = respuesta.lowercased().first, let respuestaIndex = opciones.firstIndex(of: String(letra)), respuestaIndex >= 0 && respuestaIndex < preguntaActual.opciones.count {
//
//            let opcionSeleccionada = preguntaActual.opciones[respuestaIndex]
//            if opcionSeleccionada == preguntaActual.respuestaCorrecta {
//                dineroGanado += 10
//                preguntasCorrectas.append(preguntaActual)
//            } else {
//                intentosFallidos += 1
//                preguntasIncorrectas.append(preguntaActual)
//            }
//
//            preguntas.removeFirst()
//            realizarPregunta()
//        } else {
//            print("Respuesta inválida. Por favor, seleccione una opción válida.")
//            realizarPregunta()
//        }
//    }

    func respondToQuestion(at index: Int) {
        optionButtons.forEach { $0.isEnabled = false } // Deshabilita los botones después de responder

        if questions[currentQuestionIndex].isCorrect(index) {
            score += 10
            validationQuestion.text = "Respuesta correcta"
        } else {
            remainingAttempts -= 1
            validationQuestion.text = "Respuesta incorrecta"
        }

        if remainingAttempts == 0 || currentQuestionIndex == questions.count - 1 {
            endGame()
        } else {
            currentQuestionIndex += 1
            showQuestion()
        }
    }

    func endGame() {
        let message: String
        if remainingAttempts == 0 {
            message = "Se acabaron los intentos. Tu puntaje final es \(score)."
        } else {
            message = "¡Juego completado! Tu puntaje final es \(score)."
        }

        let alert = UIAlertController(title: "Fin del juego", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Puedes agregar aquí cualquier acción adicional al finalizar el juego
        }
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
    }

}



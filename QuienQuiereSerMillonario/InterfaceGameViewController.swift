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
    var preguntasCorrectas: [Pregunta] = []
    var preguntasIncorrectas: [Pregunta] = []
    var intentosFallidos: Int = 0
    var puntosGanados: Int = 0
    var userName: String = ""

    @IBOutlet weak var enunciadoLabel: UILabel!
    @IBOutlet weak var opcion1Button: UIButton!
    @IBOutlet weak var opcion2Button: UIButton!
    @IBOutlet weak var opcion3Button: UIButton!
    @IBOutlet weak var opcion4Button: UIButton!
    @IBOutlet weak var opcion5Button: UIButton!
    @IBOutlet weak var mensajeLabel: UILabel!

    func presentarSiguientePregunta() {
        if intentosFallidos >= 3 {
            mostrarResultadosFinales()
            return
        }
        let indiceSiguientePregunta = preguntasCorrectas.count + preguntasIncorrectas.count
        guard indiceSiguientePregunta < questions.count else {
            mostrarResultadosFinales()
            return
        }
        let preguntaActual = questions[indiceSiguientePregunta]
        enunciadoLabel.text = preguntaActual.enunciado
        opcion1Button.setTitle(preguntaActual.opciones[0], for: .normal)
        opcion2Button.setTitle(preguntaActual.opciones[1], for: .normal)
        opcion3Button.setTitle(preguntaActual.opciones[2], for: .normal)
        opcion4Button.setTitle(preguntaActual.opciones[3], for: .normal)
        opcion5Button.setTitle(preguntaActual.opciones[4], for: .normal)
    }
    @IBAction func answerGameLabel(_ sender: UIButton) {
        guard let index = [opcion1Button, opcion2Button, opcion3Button, opcion4Button, opcion5Button].firstIndex(of: sender) else {
                return
            }
            let preguntaActual = questions[preguntasCorrectas.count + preguntasIncorrectas.count]
            let esCorrecta = preguntaActual.isCorrect(index)

            if esCorrecta {
                preguntasCorrectas.append(preguntaActual)
                puntosGanados += 10
                mostrarMensaje("¡Felicitaciones! Respuesta anterior correcta.")
            } else {
                preguntasIncorrectas.append(preguntaActual)
                intentosFallidos += 1
                mostrarMensaje("Respuesta anterior incorrecta. La respuesta correcta era \(preguntaActual.respuestaCorrecta).")
            }
            presentarSiguientePregunta()
        }
    func mostrarMensaje(_ mensaje: String) {
        mensajeLabel.text = mensaje
    }
    func obtenerSiguientePregunta() -> Pregunta? {
        let indiceSiguientePregunta = preguntasCorrectas.count
        guard indiceSiguientePregunta < questions.count else {
            return nil
        }
        return questions[indiceSiguientePregunta]
    }
    func prepararResultadosFinalesViewController() -> FaseFinalViewController {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultadosViewController = storyboard.instantiateViewController(withIdentifier: "FaseFinalViewController") as! FaseFinalViewController
            resultadosViewController.preguntasCorrectas = preguntasCorrectas
            resultadosViewController.preguntasIncorrectas = preguntasIncorrectas
            resultadosViewController.intentosFallidos = intentosFallidos
            resultadosViewController.puntosGanados = puntosGanados
            return resultadosViewController
        }
    func mostrarResultadosFinales() {
            let resultadosViewController = prepararResultadosFinalesViewController()
            navigationController?.pushViewController(resultadosViewController, animated: true)
        }
    func reiniciarJuego() {
        preguntasCorrectas = []
        preguntasIncorrectas = []
        intentosFallidos = 0
        puntosGanados = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presentarSiguientePregunta()
    }

}



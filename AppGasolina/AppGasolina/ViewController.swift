//
//  ViewController.swift
//  AppGasolina
//
//  Created by John Lima on 10/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var precoAlcoolTextField: UITextField!
  @IBOutlet weak var precoGasolinaTextField: UITextField!
  @IBOutlet weak var resultadoLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }

  @IBAction func calcularCombustível(_ sender: Any) {

    var precoAlcool: Double = 0
    var precoGasolina: Double = 0
    var resultadoPreço: Double = 0

    //Validaçōes
    if let resultadoAlcool = precoAlcoolTextField.text {
      if resultadoAlcool != "" {
        if let resultadoNumero = Double(resultadoAlcool) {
          precoAlcool = resultadoNumero
        }
      }
    }

    if let resultadoGasolina = precoGasolinaTextField.text {
      if resultadoGasolina != "" {
        if let resultadoNumero = Double(resultadoGasolina) {
          precoGasolina = resultadoNumero
        }
      }
    }

    //Calculo ( preco / precoGasolina ) >= 0.7
    resultadoPreço = precoAlcool / precoGasolina

    if resultadoPreço >= 0.7 {
      resultadoLabel.text = "Melhor utilizar Gasolina!"
    }else{
      resultadoLabel.text = "Melhor utilizar Álcool!"
    }

    view.endEditing(true)
  }
}


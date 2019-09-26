//
//  ViewController.swift
//  PassandoDadosEntreViews
//
//  Created by John Lima on 19/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var nomeTextField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    if segue.identifier == "EnviarDadosDetalhes" {
      let viewControllerDestino = segue.destination as!  DetalhesViewController

      viewControllerDestino.textoRecebido = nomeTextField.text

    }
  }
}

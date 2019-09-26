//
//  ViewController.swift
//  ThaisSwift
//
//  Created by John Lima on 06/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    //Classes e Objetos/ Classe é igual a planta e a casa é o objeto!

    //Criar o objeto
    let casa = Casa(cor: "Amarelo")
    _ = casa.getCor()

    let casa2 = Casa(cor: "Roxo")
    _ = casa2.getCor()

    let cachorro = Cachorro(cor: "Roxo")
    cachorro.bark()
    cachorro.run()
  }
}


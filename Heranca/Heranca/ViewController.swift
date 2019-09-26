//
//  ViewController.swift
//  Heranca
//
//  Created by John Lima on 09/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //Criar Objeto

    let cachorro = Cachorro()
    print(cachorro.cor)
    print(cachorro.latir())

    let passaro = Passaro()
    print(passaro.cor)
    print(passaro.voar())

    let papagaio = Papagaio()
    print(papagaio.repetir())

  }
}


//
//  File.swift
//  ThaisSwift
//
//  Created by John Lima on 07/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import Foundation

//Desafio: criar uma classe cachorro que tem o atributo cor e os métodos correr e latir.

//Sempre iniciar uma classe com letra maiúscula!

//Variáveis e constantes iniciam com letra minúscula.

class Cachorro {
  var cor: String

  init(cor: String) {
    self.cor = cor
  }

  func run() {
    print("🐶 correndo")
  }

  func bark() {
    print("🐶 latindo")
  }
}


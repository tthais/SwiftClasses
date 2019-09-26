//
//  ViewController.swift
//  FuncoesSwift
//
//  Created by John Lima on 05/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    let numero: Int = multiplicar(numero1: 2, numero2: 3)
    print(numero)

    let idade = calcularIdade(ano: 1991)
    print("A idade é: " + String(idade))

  }

  //Funções
  func multiplicar(numero1: Int, numero2: Int) -> Int {
    return numero1 * numero2
  }

  // Desafio: Criar uma função que recebe como parametro o ano de nascimento de uma pessoa e vai descobrir a idade da pessoa.
  func calcularIdade(ano: Int) -> Int {
    return 2019 - ano

  }
}

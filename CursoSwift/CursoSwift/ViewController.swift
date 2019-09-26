//
//  ViewController.swift
//  CursoSwift
//
//  Created by John Lima on 05/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    //Loops - For

    
    for i in 0..<5 {
      print("numero: " + String(i))
    }


    var comentarios:[String] = []
    comentarios.append("Gostei da foto...muito legal!!!")
    comentarios.append("Gostei da praia...muito legal!!!")
    comentarios.append("Gostei da comida")

/*
    var contador: Int = 0

    while contador < 6 {

      print(contador)
      contador += 1
      contador = contador + 1
    }
    */

    /*
    repeat {
      print(contador)
      contador += 1

    } while contador < 0
 */
  }
}

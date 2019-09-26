//
//  ViewController.swift
//  OpcionaisSwift
//
//  Created by John Lima on 06/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class ViewContsroller: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    //As variavéis são utilizadas para armazenar valores e podem ter seu valor ALTERADO
    var valor1: Int
    var valor2: Int?
    var total: Int

    valor1 = 10
    valor2 = 1

    if let valor2testado = valor2 {
      total = valor1 + valor2testado
      print(total)
    }
  }
}


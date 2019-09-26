//
//  DetalhesViewController.swift
//  PassandoDadosEntreViews
//
//  Created by John Lima on 19/09/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import Foundation

import UIKit

class DetalhesViewController: UIViewController {
  @IBOutlet weak var resultadoLabel: UILabel!
  
  var textoRecebido: String!


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    resultadoLabel.text = textoRecebido


  }


}

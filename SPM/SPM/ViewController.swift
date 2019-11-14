//
//  ViewController.swift
//  SPM
//
//  Created by Thais Costa on 12/11/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let service = Service()

  override func viewDidLoad() {
    super.viewDidLoad()

    service.fetchItems { result in
      switch result {
      case .success(_, let model):
        print(" Sucesso: \(model.launchYear)")
      case .failure(let erro):
        print(" Erro: \(erro.localizedDescription)")
      }
    }
  }
}

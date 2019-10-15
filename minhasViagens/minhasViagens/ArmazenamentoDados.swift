//
//  ArmazenamentoDados.swift
//  ondeEstou
//
//  Created by Thais Costa on 14/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import Foundation

class ArmazenamentoDados {

  typealias Dict = [String: Any]

  let chaveArmazenamento = "locaisViagem"
  var viagens: [Dict] = []

  func salvar(viagem: Dict) {
    viagens = listarViagens()
    viagens.append(viagem)
    UserDefaults.standard.set(viagens, forKey: chaveArmazenamento)
    print(listarViagens() as NSArray)
  }

  func listarViagens() -> [Dict] {
    return UserDefaults.standard.array(forKey: chaveArmazenamento) as? [Dict] ?? []
  }

  func removerViagem()  {

  }
}

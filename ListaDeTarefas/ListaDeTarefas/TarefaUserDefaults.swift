//
//  TarefaUserDefaults.swift
//  ListaDeTarefas
//
//  Created by John on 30/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class TarefaUserDefaults {

  // MARK: - Properties
  let defaults = UserDefaults.standard
  let chaveListaTarefa = "listaTarefa"
  var tarefas: [String] = []

  // MARK: - Internal Methods
  func salvarTarefas(tarefa: String) {

    // recupera tarefas
    tarefas = listarTarefas()

    // adicionar
    tarefas.append(tarefa)

    defaults.set(tarefas, forKey: chaveListaTarefa)
  }

  func listarTarefas() -> [String] {
    let dados = defaults.object(forKey: chaveListaTarefa) as? [String] ?? [String]()
    print(" dados: \(dados)")
    return dados
  }

  func removerTarefa(indice: Int) {

    //recupera tarefas
    tarefas = listarTarefas()

    tarefas.remove(at: indice)

    defaults.set(tarefas, forKey: chaveListaTarefa)

  }
}

//
//  ViewController.swift
//  ListaDeTarefas
//
//  Created by John on 29/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  // MARK: - Properties
  var tarefas: [String] = []


  // MARK: - View LifeCycle
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    atualizarListaDeTarefas()
  }

  // MARK: - Internal Methods
  func atualizarListaDeTarefas() {
    tarefas = TarefaUserDefaults().listarTarefas()
    tableView.reloadData()
  }

  // MARK: - UITableViewDataSource
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tarefas.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
    cell.textLabel?.text = tarefas[indexPath.row]
    return cell
  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {

      let tarefaUserDefaults = TarefaUserDefaults ()
      tarefaUserDefaults.removerTarefa(indice: indexPath.row)
      atualizarListaDeTarefas()
      


    }
  }
}


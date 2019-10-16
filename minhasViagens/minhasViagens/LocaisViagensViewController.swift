//
//  LocaisViagensViewController.swift
//  minhasViagens
//
//  Created by Thais Costa on 10/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit

class LocaisViagensViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  var locaisViagens: [ArmazenamentoDados.Dict] = []

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    atualizar()
  }

  func atualizar() {
    locaisViagens = ArmazenamentoDados().listarViagens()
    tableView.reloadData()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locaisViagens.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "viagens", for: indexPath)
    cell.textLabel?.text = locaisViagens[indexPath.row]["local"] as? String
    
    return cell
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      ArmazenamentoDados().removerViagem(indice: indexPath.row)
      atualizar()
    }
  }
}

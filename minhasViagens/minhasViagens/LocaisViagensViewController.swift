//
//  LocaisViagensViewController.swift
//  minhasViagens
//
//  Created by John Lima on 10/10/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class LocaisViagensViewController: UIViewController, UITableViewDataSource {

  var locaisViagens = ["Sociedade Esportiva Palmeiras", "Apple Inc.", "Eiffel Tower", "Colosseum"]

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locaisViagens.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "viagens", for: indexPath)
    cell.textLabel?.text = locaisViagens[indexPath.row]
    
    return cell

  }

}

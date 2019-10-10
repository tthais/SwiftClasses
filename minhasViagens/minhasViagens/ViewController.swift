//
//  ViewController.swift
//  minhasViagens
//
//  Created by John Lima on 10/10/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {


   var dados = ["Sociedade Esportiva Palmeiras", "Apple Inc.", "Eiffel Tower", "Colosseum"]

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dados.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "viagens", for: indexPath)
    cell.textLabel?.text = dados[indexPath.row]
    return cell

   }

}


//
//  ViewController.swift
//  TableViewController
//
//  Created by John on 21/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dados: [String] = ["Lasanha", "Pizza", "Torta"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = dados[indexPath.row]
        
        return celula
        
    }
    

}


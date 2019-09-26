//
//  ViewController.swift
//  CaraOuCoroa
//
//  Created by John on 19/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "jogarMoeda" {
            
            let numero = arc4random_uniform(2)
            let viewControllerDestino = segue.destination as! DetalhesViewContoller
            print(numero)
            viewControllerDestino.numeroRandomicoRecebido = Int (numero)
            
        }
    }
}

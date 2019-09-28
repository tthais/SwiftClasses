//
//  ViewController.swift
//  SalvarDadosUsuario
//
//  Created by John on 27/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // UserDefaults.standard.set("azul", forKey: "corFundo")
        
        //let texto = UserDefaults.standard.object(forKey: "corFundo")
        // print(texto)
        
        //let array: [String] = ["Lasanha", "Pizza", "Torta"]
        //UserDefaults.standard.set(array, forKey: "comidas")
        
        UserDefaults.standard.removeObject(forKey: "comidas")
        
        let arrayRecuperado = UserDefaults.standard.object(forKey: "comidas")
        print(arrayRecuperado)
    }
}

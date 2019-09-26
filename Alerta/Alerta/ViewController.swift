//
//  ViewController.swift
//  Alerta
//
//  Created by John on 21/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func abrirAlerta(_ sender: Any) {
        //Criar alerta
        
        let alerta = UIAlertController(title: "Adicionar Contato", message: "Deseja adicionar o contato?", preferredStyle: .alert)
        let acaoConfirmar = UIAlertAction (title: "Confirmar", style: .default, handler: nil)
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(acaoConfirmar)
        alerta.addAction(acaoCancelar)

        
        present(alerta, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

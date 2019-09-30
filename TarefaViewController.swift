//
//  TarefaViewController.swift
//  ListaDeTarefas
//
//  Created by John on 30/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController {
    
    @IBOutlet weak var tarefaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func adicionarTarefa(_ sender: UIButton) {
        
        if let tarefa = tarefaTextField.text{
            
            let tarefaUserDefaults = TarefaUserDefaults()
            tarefaUserDefaults.salvarTarefas()
        }
    }
}

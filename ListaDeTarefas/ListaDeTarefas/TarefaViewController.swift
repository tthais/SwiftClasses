//
//  TarefaViewController.swift
//  ListaDeTarefas
//
//  Created by John on 30/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController {

  // MARK: - Properties
  @IBOutlet weak var tarefaTextField: UITextField!

  let tarefaUserDefaults = TarefaUserDefaults()

  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }

  // MARK: - Actions
  @IBAction func adicionarTarefa(_ sender: UIButton) {
    if let tarefa = tarefaTextField.text, !tarefa.isEmpty {
      tarefaUserDefaults.salvarTarefas(tarefa: tarefa)
      tarefaTextField.text = ""
    }
  }
}

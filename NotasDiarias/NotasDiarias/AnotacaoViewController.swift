//
//  ViewController.swift
//  NotasDiarias
//
//  Created by Thais Costa on 27/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit
import CoreData

class AnotacaoViewController: UIViewController {

  @IBOutlet weak var texto: UITextView!
  
  var gerenciadorObjetos: NSManagedObjectContext!

  override func viewDidLoad() {
    super.viewDidLoad()

    //Configuarar Core Data
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    gerenciadorObjetos = appDelegate.persistentContainer.viewContext

    //Abrir automaticamente o teclado
    self.texto.becomeFirstResponder()
    self.texto.text = ""
  }

  @IBAction func salvarAnotacao(_ sender: Any){
    self.salvar()

    //Retorno para tela inicial
    self.navigationController?.popViewController(animated: true)
  }

  func salvar(){

    let novaAnotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: gerenciadorObjetos)

    //Configurar anotacao
    novaAnotacao.setValue(self.texto.text, forKey: "texto")
    novaAnotacao.setValue(NSDate(), forKey: "data")

    do {
      try gerenciadorObjetos.save()
      print("Sucesso ao salvar")
    } catch let erro as NSError {
      print("Erro ao salvar anotacao Erro: \(erro.description)")
    }
  }
}

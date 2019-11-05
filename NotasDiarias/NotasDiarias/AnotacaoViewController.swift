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
  var anotacao: NSManagedObject!

  override func viewDidLoad() {
    super.viewDidLoad()

    //Configuarar Core Data
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    gerenciadorObjetos = appDelegate.persistentContainer.viewContext

    //Abrir automaticamente o teclado
    self.texto.becomeFirstResponder()

    if anotacao != nil {//Atualizar

      navigationItem.title = "Atualizar"

      self.texto.text = anotacao.value(forKey: "texto") as? String

    }else{//salvar
      self.texto.text = ""

      navigationItem.title = "Adcionar"
    }

  }

  @IBAction func salvarAnotacao(_ sender: Any){
    if anotacao != nil { //Atualizar
      atualizar()
      navigationItem.title = "Atualizar"
    } else { //salvar
      salvar()
    }

    //Retorno para tela inicial
    navigationController?.popViewController(animated: true)
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

  func atualizar() {

    anotacao.setValue(self.texto.text, forKey: "texto")
    anotacao.setValue( NSDate(), forKey: "data")

    do {
      try gerenciadorObjetos.save()
      print("Sucesso ao Atualizar")
    } catch let erro as NSError {
      print("Erro ao Atualizar Anotação Erro: \(erro.description)")
    }

  }
}

//
//  ViewController.swift
//  BancoDeDados
//
//  Created by John Lima on 19/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    //Configuracoes iniciais para utilizar o core Data

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext

    //Como salvar dados utilizando Core data

    let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: context)

    //Configurar objeto

    usuario.setValue("thaislima", forKey: "loginUsuario")
    usuario.setValue("senha123", forKey: "senha")
    usuario.setValue("vania", forKey: "nome")
    usuario.setValue(35, forKey: "idade")

    do {
     try context.save()
      print("Dados salvos com sucesso!")

    } catch {
      print("Erro ao salvar os dados.")

    }
  }
}

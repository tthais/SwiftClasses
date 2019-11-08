//
//  ListaAnotacaoViewController.swift
//  NotasDiarias
//
//  Created by Thais Costa on 28/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit
import CoreData

class ListaAnotacaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  var gerenciadorObjetos: NSManagedObjectContext!
  var anotacoes: [NSManagedObject] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    //Configuarar Core Data
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    gerenciadorObjetos = appDelegate.persistentContainer.viewContext
  }

  override func viewDidAppear(_ animated: Bool) {
    recuperarAnotacoes()
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.anotacoes.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
    let anotacao = self.anotacoes[indexPath.row]
    
    //Formatar data
    var data: String? {
      if let date = anotacao.value(forKey: "data") as? Date {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd/MM/yyyy HH:ss"
        return formatador.string(from: date)
      }
      return nil
    }

    celula.textLabel?.text = anotacao.value(forKey: "texto") as? String
    celula.detailTextLabel?.text = data

    return celula
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.deselectRow(at: indexPath, animated: true)
    let anotacao = anotacoes[ indexPath.row ]
    self.performSegue(withIdentifier: "verAnotacao", sender: anotacao)

  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    if editingStyle == .delete {

      let indice = indexPath.row
      let anotacao = self.anotacoes[ indice ]

      self.gerenciadorObjetos.delete(anotacao)
      self.anotacoes.remove(at: indice)

      do {
        try gerenciadorObjetos.save()
        self.tableView.deleteRows(at: [indexPath], with: .bottom)

      } catch let erro {
        print("Erro ao remover: \(erro.localizedDescription)")
      }

    }

  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    if segue.identifier == "verAnotacao" {

      let viewControllerDestino = segue.destination as! AnotacaoViewController
      viewControllerDestino.anotacao = sender as? NSManagedObject

    }

  }

  func recuperarAnotacoes() {

    //Recupera todas as anotações
    let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Anotacao")

    let ordenacao = NSSortDescriptor(key: "data", ascending: true)
    requisicao.sortDescriptors = [ordenacao]

    do {

      let anotacoesRecuperadas = try gerenciadorObjetos.fetch(requisicao)
      self.anotacoes = anotacoesRecuperadas as! [NSManagedObject]

      self.tableView.reloadData()

    } catch let erro as NSError {
      print("Erro ao listar Antocoes ERRO: \(erro.description)")
    }
  }
}

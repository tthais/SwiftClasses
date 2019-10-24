//
//  ViewController.swift
//  BancoDeDados
//
//  Created by Thais Costa on 19/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    listarOuAtualizarProdutos()
  }

  /// Como salvar dados do usuário utilizando Core data
  func salvarUsuario() {
    // Configuracoes iniciais para utilizar o core Data
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext

    let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: context)

    // Configurar objeto
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

  /// Como salvar dados do produto utilizando Core data
  func salvarProduto() {
    // Configuracoes iniciais para utilizar o core Data
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)

    //Configurar produto
    produto.setValue("skate", forKey: "nome")
    produto.setValue("tres rodas", forKey: "descricao")
    produto.setValue("personalizado", forKey: "cor")
    produto.setValue(350.00, forKey: "preco")

    do {
      try context.save()
      print("Dados salvos com sucesso!")
    } catch {
      print("Erro ao salvar os dados.")
    }
  }

  /// Como salvar dados do produto utilizando Core data
  func listarOuAtualizarProdutos() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext

    //Exibindo os produtos salvos.
    let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")

    //Ordenar de A-Z
    let ordenacaoAZ = NSSortDescriptor(key: "nome", ascending: true)

    //Ordenar de Z-A
    let ordenacaoZA = NSSortDescriptor(key: "preco", ascending: false)

    //Aplicar filtros
    // [c] - Case insensitive, significa não diferenciar letras maiúsculas de minuscúlas
   // let predicate = NSPredicate(format: "nome contains [c] %@", "Bic")

    //Aplicar filtros a requisicao
    requisicao.sortDescriptors = [ordenacaoAZ, ordenacaoZA]
   // requisicao.predicate = predicate

    do {
      let produtos = try context.fetch(requisicao)

      //Verifica se existe produtos:
      if produtos.count > 0 {
        for produto in produtos {

          let produto = produto as AnyObject


          if let nomeProduto = (produto).value(forKey: "nome"),
            let descricaoProduto = (produto).value(forKey: "descricao"),
            let corProduto = (produto).value(forKey: "cor"),
            let precoProduto = (produto).value(forKey: "preco") {

            print("-----------------------------")
            print(nomeProduto)
            print(descricaoProduto)
            print(corProduto)
            print("R$ \(precoProduto)")
            print("-----------------------------")
            /*
            //atualizar
            produto.setValue(199, forKey: "preco")
            produto.setValue("Iphone 5S", forKey: "nome")

            do {
              try context.save()
              print("Sucesso ao atualizar dados!!")
            } catch {
              print("Erro ao atualizar dados!!")
            }
            */
          }
        }
      } else {
        print("Nenhum produto encontrado!")
      }
    } catch {
      print("Erro ao recuperar dados!")
    }
  }
}

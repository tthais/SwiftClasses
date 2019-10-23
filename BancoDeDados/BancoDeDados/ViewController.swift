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
    // Do any additional setup after loading the view.

    //Configuracoes iniciais para utilizar o core Data

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext

    /*
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
     */
    /*
    //Como recuperar dados utilizando o Core Data:

    let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")

    do {
      let usuarios = try context.fetch(requisicao)

      //Verifica se existe usuarios:
      if usuarios.count > 0 {
        for usuario in usuarios {
          if let nomeUsuario = (usuario as AnyObject).value(forKey: "nome") {
            print(nomeUsuario)
          }
        }
      } else {
        print("Nenhum usuário encontrado!")
      }
    } catch {
      print("Erro ao recuperar dados!")
    }
    */

    //Desafio! Criar uma entidade chamada Produtos. Colocar os atributos nome, cor e descrição do produto com preço e criar a estrutura para salvar os dados do produto e exibir os produtos salvos.

    /*
    //Salvando produto:

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
    */

    //Exibindo os produtos salvos.
    let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")

    //Ordenar de A-Z
    let ordenacaoAZ = NSSortDescriptor(key: "nome", ascending: true)

    //Ordenar de Z-A
    let ordenacaoZA = NSSortDescriptor(key: "preco", ascending: false)

    //Aplicar filtros
    // [c] - Case insensitive, significa não diferenciar letras maiúsculas de minuscúlas
    let predicate = NSPredicate(format: "nome contains [c] %@", "Bic")

    //Aplicar filtros a requisicao
    requisicao.sortDescriptors = [ordenacaoAZ, ordenacaoZA]
    requisicao.predicate = predicate

    do {
      let produtos = try context.fetch(requisicao)

      //Verifica se existe produtos:
      if produtos.count > 0 {
        for produto in produtos {
          if let nomeProduto = (produto as AnyObject).value(forKey: "nome"),
            let descricaoProduto = (produto as AnyObject).value(forKey: "descricao"),
            let corProduto = (produto as AnyObject).value(forKey: "cor"),
            let precoProduto = (produto as AnyObject).value(forKey: "preco") {

            print("-----------------------------")
            print(nomeProduto)
            print(descricaoProduto)
            print(corProduto)
            print("R$ \(precoProduto)")
            print("-----------------------------")

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

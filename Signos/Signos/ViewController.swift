//
//  ViewController.swift
//  Signos
//
//  Created by thais on 22/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //
    let dados: [String] = ["Áries", "Touro", "Gêmeos", "Câncer", "Leão", "Virgem", "Libra", "Escorpião", "Sagitário", "Capricórnio", "Aquário", "Peixes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //numberOfSections: É usado quando a TableView tem mais de uma seção,mas nesse caso não foi preciso usar pq o App tem somente uma seção!
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //numberOfRowsInSection: Determina a quantidade de itens que vai aparecer na lista!
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    //cellForRowAt: Monta o layout da célula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dados[indexPath.row]
        return cell
        
    }
    //Toda vez que clicar na linhao método será chamado:didSelectRowAt ------> (1ºPasso)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Clicar na lista e ter efeito rápido de seleção usa o: deselectRow ----->(2ºPasso)
        tableView.deselectRow(at: indexPath, animated: true)
        
        // UIAlertController: Serve para o Layout do alerta "O que vai ser mostrado"
        let alerta = UIAlertController(title: "Sobre seu signo", message: "O Ariano é esperto!", preferredStyle: .alert)
        let acaoFechar = UIAlertAction(title: "OK", style: .default)
        alerta.addAction(acaoFechar)
        
        //O 'present' serve para para fazer o alerta abrir "Exibir uma tela"
         present(alerta, animated: true)
       
    }


}


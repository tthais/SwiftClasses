//
//  TarefaUserDefaults.swift
//  ListaDeTarefas
//
//  Created by John on 30/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class TarefaUserDefaults {
    
    // MARK: - Properties
    let defaults = UserDefaults.standard
    let chaveListaTarefa = "listaTarefa"
    
    // MARK: - Internal Methods
    func salvarTarefas(tarefa: String) {
        
        // recupera tarefas
        var array = listarTarefas()
        
        // adicionar
        array.append(tarefa)
        
        defaults.set(array, forKey: chaveListaTarefa)
    }
    
    func listarTarefas() -> [String] {
        let dados = defaults.object(forKey: chaveListaTarefa) as? [String] ?? [String]()
        print(" dados: \(dados)")
        return dados
    }
    
    func removerTarefa() {
        
    }
}

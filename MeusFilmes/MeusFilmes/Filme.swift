//
//  Filme.swift
//  MeusFilmes
//
//  Created by Thais on 23/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

struct Filme {
    let titulo: String
    let descricao: String
    let imagem: UIImage
    
    static func getFilmes() -> [Filme] {
        let result: [Filme] = [
            Filme(titulo: "007 - Spectre", descricao: "descricao 1", imagem: #imageLiteral(resourceName: "filme1")),
            Filme(titulo: "Star Wars", descricao: "descricao 2", imagem: #imageLiteral(resourceName: "filme2")),
            Filme(titulo: "Impacto Mortal", descricao: "descricao 3", imagem: #imageLiteral(resourceName: "filme3")),
            Filme(titulo: "Deadpool", descricao: "descricao 4", imagem: #imageLiteral(resourceName: "filme4")),
            Filme(titulo: "o Regresso", descricao: "descricao 5", imagem: #imageLiteral(resourceName: "filme5")),
            Filme(titulo: "A herdeira", descricao: "descricao 6", imagem: #imageLiteral(resourceName: "filme6")),
            Filme(titulo: "Caçadores de emoção", descricao: "descricao 7", imagem: #imageLiteral(resourceName: "filme7")),
            Filme(titulo: "Regresso do mal ", descricao: "descricao 8", imagem: #imageLiteral(resourceName: "filme8")),
            Filme(titulo: "tarzan", descricao: "descricao 9", imagem: #imageLiteral(resourceName: "filme9")),
            Filme(titulo: "Hardcore", descricao: "descricao 9", imagem: #imageLiteral(resourceName: "filme10"))
        ]
        return result
    }
}

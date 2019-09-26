//
//  ViewController.swift
//  MeusFilmes
//
//  Created by John on 23/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    /// Constante com a lista de filmes
    let filmes = Filme.getFilmes()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filme = filmes[indexPath.row]
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmeCelula
        celula.titleLabel?.text = filme.titulo
        celula.descriptionLabel?.text = filme.descricao
        celula.fotoImageView?.image = filme.imagem
        celula.fotoImageView?.layer.cornerRadius = celula.fotoImageView.frame.size.height / 2
        celula.fotoImageView?.layer.masksToBounds = true
        
        return celula
    }
    //Esse código: didSelectRowAt serve para capturar o click na lista!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    /*Há duas maneiras de arredondar uma imagem ou botão, pelo Main.Storyboard e por código.
    //Classe (layer)
    //clipsToBounds: Serve para cortar as bordas
    //Outro exemplo de código:  celula.fotoImageView.layer.cornerRadius = 42
                                celula.fotoImageView.clipsToBounds = true*/
}

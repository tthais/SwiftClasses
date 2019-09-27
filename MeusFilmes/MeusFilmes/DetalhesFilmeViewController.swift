//
//  DetalhesFilmeViewController.swift
//  MeusFilmes
//
//  Created by John on 26/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import Foundation
import UIKit

class DetalhesFilmeViewController: UIViewController {
    
    @IBOutlet weak var filmeImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var filme: Filme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmeImageView.image = filme.imagem
        tituloLabel.text = filme.titulo
        descricaoLabel.text = filme.descricao
    }
}

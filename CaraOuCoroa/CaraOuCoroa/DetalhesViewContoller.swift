//
//  DetalhesViewContoller.swift
//  CaraOuCoroa
//
//  Created by John on 20/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import Foundation

import UIKit

class DetalhesViewContoller: UIViewController {
    
    @IBOutlet weak var moedaImageView: UIImageView!
    
    var numeroRandomicoRecebido: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if numeroRandomicoRecebido == 0 {//cara
            
            moedaImageView.image = #imageLiteral(resourceName: "moeda_cara")
            
        }else{//coroa
            
            moedaImageView.image = #imageLiteral(resourceName: "moeda_coroa")
            
        }
    }


}

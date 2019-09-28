//
//  ViewController.swift
//  MinhasAnotacoesAula
//
//  Created by Thais on 28/09/19.
//  Copyright © 2019 CursoSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //serve para capturar o toque na tela!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) 
    }
    
    @IBAction func salvarAnotacao(_ sender: Any) {
        
    }
    
}


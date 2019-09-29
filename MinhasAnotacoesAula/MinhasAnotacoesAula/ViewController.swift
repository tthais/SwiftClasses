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
    
    let minhaAnotacaoChave = "MinhaAnotacao"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //recuperar dados
        textoTextView.text = recuperadrDado()
    }
    
    //serve para capturar o toque na tela!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       esconderTeclado()
    }
    
    @IBAction func salvarAnotacao(_ sender: Any) {
        esconderTeclado()
        if let texto = textoTextView.text{
            SalvarDadosAnotacao(texto: texto)
            mostrarAlerta(texto)
        }
    }
    
    func SalvarDadosAnotacao(texto: String) {
        UserDefaults.standard.set(texto, forKey: minhaAnotacaoChave)
    }
    
    func recuperadrDado() -> String? {
        let textorecuperado = UserDefaults.standard.object(forKey: minhaAnotacaoChave)
        return textorecuperado as? String
    }
    
    func mostrarAlerta(_ texto: String) {
        let alerta = UIAlertController(title: "Anotação", message: "Anotação salva com sucesso! 😉 \n\n\(texto)", preferredStyle: .alert)
        let fechar = UIAlertAction(title: "Ok", style: .default)
        alerta.addAction(fechar)
        present(alerta, animated: true)
    }
    
    func esconderTeclado() {
        view.endEditing(true)
    }
    
    // Só funciona sem a navegation! Serve para esconder o statusBar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

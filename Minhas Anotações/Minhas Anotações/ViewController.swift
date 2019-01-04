//
//  ViewController.swift
//  Minhas Anotações
//
//  Created by Flávio Oliveira on 03/01/19.
//  Copyright © 2019 Flávio Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoTextView: UITextView!
    let minhaAnotacaoChave  = "minhaAnotacao"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //recuperando os dados salvos
        let textoRecuperado = self.recuperarDadosAnotacao()
        textoTextView.text = textoRecuperado
    }
    
    @IBAction func salvarAnotacao(_ sender: Any) {
        
        if let texto = textoTextView.text {
            
            self.salvarDadosAnotacao(texto: texto)
            esconderTeclado()
        }
        
        
    }
    
    //funcao que irá salvar os dados que o usuário digitou
    func salvarDadosAnotacao(texto: String){
        UserDefaults.standard.set(texto, forKey: minhaAnotacaoChave)
    }
    
    //recuperando
    func recuperarDadosAnotacao() -> String {
        let textoRecuperado = UserDefaults.standard.object(forKey: minhaAnotacaoChave)
        if textoRecuperado != nil {
         
            return textoRecuperado as! String
            
        }else {
            
            return ""
        }
    }
    
    //ocultando a barra de status
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //esconder teclado quando clica no botão salvar
    func esconderTeclado(){
        view.endEditing(true)
    }
    
    
    //ocultando o teclado clicando em qualquer área do app
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.esconderTeclado()
    }
    


}


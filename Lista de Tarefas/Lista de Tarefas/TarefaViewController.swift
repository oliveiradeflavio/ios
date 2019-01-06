//
//  TarefaViewController.swift
//  Lista de Tarefas
//
//  Created by Flávio Oliveira on 05/01/19.
//  Copyright © 2019 Flávio Oliveira. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController {

    @IBOutlet weak var tarefaTextFiel: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func adicionarTarefa(_ sender: Any) {
        
        if let tarefa = tarefaTextFiel.text{
            
            let tarefaUserDefaults = TarefaUserDefaults()
            tarefaUserDefaults.salvarTarefa(tarefa: tarefa)
            tarefaTextFiel.text = ""
        }
        
        
        
    }
    
    //ocultando o teclado quando é clicado fora do campo de texto (textfield)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

   
    


}

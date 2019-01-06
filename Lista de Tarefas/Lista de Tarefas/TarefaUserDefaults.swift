//
//  TarefaUserDefaults.swift
//  Lista de Tarefas
//
//  Created by Flávio Oliveira on 05/01/19.
//  Copyright © 2019 Flávio Oliveira. All rights reserved.
//

import UIKit

class TarefaUserDefaults {
    
    let chaveListaTarefa = "listaTarefa"
    var tarefas: [String] = []
    
    
    func salvarTarefa(tarefa: String){
        
        
        
        //recuperar as tarefas que já existem
        tarefas = listarTarefa()
        
        
        //adicionar
        tarefas.append( tarefa )
        UserDefaults.standard.set( tarefas, forKey: chaveListaTarefa )
        
        
    }
    
    func listarTarefa() -> Array<String>{
        
        
        let dados = UserDefaults.standard.object(forKey: chaveListaTarefa)
    
        if dados != nil {
            return dados as! Array
      
        }else {
            
               return []
        }
        
     
    }
    
    func removerTarefa( indice: Int ){
        
        //recuperar as tarefas que já existem
        tarefas = listarTarefa()
        
        tarefas.remove(at: indice)
        
        UserDefaults.standard.set(tarefas, forKey: chaveListaTarefa)
               
    }
    
    
}

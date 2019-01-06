//
//  ViewController.swift
//  Lista de Tarefas
//
//  Created by Flávio Oliveira on 05/01/19.
//  Copyright © 2019 Flávio Oliveira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var tarefas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        atualizarListaTarefa()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = tarefas[ indexPath.row ]
        
        
        return celula
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            let tarefaUserDefault = TarefaUserDefaults()
            tarefaUserDefault.removerTarefa( indice: indexPath.row )
            
            atualizarListaTarefa()
            tableView.reloadData()
            
        }
        
    }
    
    //anima o clique quando é clicado em um listview.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        atualizarListaTarefa()
        tableView.reloadData()
    }
    
    func atualizarListaTarefa(){
        
        let tarefaUserDefaults = TarefaUserDefaults()
        tarefas = tarefaUserDefaults.listarTarefa()
        
    }
        


}


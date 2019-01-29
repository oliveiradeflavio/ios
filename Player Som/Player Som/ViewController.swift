//
//  ViewController.swift
//  Player Som
//
//  Created by Flávio Oliveira on 28/01/19.
//  Copyright © 2019 Flávio Oliveira. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player  =  AVAudioPlayer()
    var caminhoMusica: [String] = ["fftimelikethese", "entersadman", "maninthebox"]
    var numero: Int = 0
    
    
    @IBOutlet weak var musicaTocando: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     /*   if let path = Bundle.main.path(forResource: caminhoMusica[numero] , ofType: "mp3" ) {
            let url = URL(fileURLWithPath: path)
            player = try! AVAudioPlayer(contentsOf: url)
            player.prepareToPlay() //prepara o áudio para ser executado
        }
        
        */
        musicasAleatorias()
    }

    
    @IBAction func play(_ sender: Any) {
           player.play() //executar o som
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0 //zerar o tempo de execucao
    }
    
    @IBAction func atualizarVolume(_ sender: Any) {
        //print(sliderVolume.value)
        player.volume = sliderVolume.value
   
    }
    
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBOutlet weak var imagemMusica: UIImageView!
    
    
    @IBAction func avancarMusica(_ sender: Any) {
            musicasAleatorias()
    }
    
    @IBAction func voltarMusica(_ sender: Any) {
            musicasAleatorias()
    }
    
    
    func musicasAleatorias(){
        
        numero = Int.random(in: 0..<3)

        
        if let path = Bundle.main.path(forResource: caminhoMusica[numero] , ofType: "mp3" ) {
            let url = URL(fileURLWithPath: path)
           
            if caminhoMusica[numero] == "fftimelikethese" {
                
                
                imagemMusica.image = UIImage(named: "foofighterstimelikethese")
                musicaTocando.text = "Foo Fighters - Time Like These"
                print(caminhoMusica[numero])
                player = try! AVAudioPlayer(contentsOf: url)
               // player.prepareToPlay() //prepara o áudio para ser executado
               
                player.play()
                
            
                
            }else if caminhoMusica[numero] == "entersadman" {
       
                musicaTocando.text = "Metallica - Enter Sadman"
                imagemMusica.image = UIImage(named: "metallica")
                print(caminhoMusica[numero])
                player = try! AVAudioPlayer(contentsOf: url)
               // player.prepareToPlay() //prepara o áudio para ser executado
                
                player.play()
         
                
            }else if caminhoMusica[numero] == "maninthebox" {
       
                musicaTocando.text = "Alice in Chains - Man in the Box"
                imagemMusica.image =  UIImage(named: "aliceinchains")
                print(caminhoMusica[numero])
                player = try! AVAudioPlayer(contentsOf: url)
               // player.prepareToPlay() //prepara o áudio para ser executado
                
                player.play()
      
            
               
            }
            
         
           
            
         
        }
    }
    
   
}


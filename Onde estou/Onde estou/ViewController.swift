//
//  ViewController.swift
//  Onde estou
//
//  Created by Flávio Oliveira on 14/01/19.
//  Copyright © 2019 Flávio Oliveira. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
    }
    
    //atualizando a localização do usuário
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario = locations.last!
        
        let longitude = localizacaoUsuario.coordinate.longitude
        let latitude = localizacaoUsuario.coordinate.latitude
        
        longitudeLabel.text = String(describing: longitude)
        latitudeLabel.text = String(describing: latitude)
        
        if localizacaoUsuario.speed > 0 {
            velocidadeLabel.text = String(describing: localizacaoUsuario.speed )
        }
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let areaExibicao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLat, longitudeDelta: deltaLon)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaExibicao)
        mapa.setRegion(regiao, animated: true)
        
        
        //recuperar os dados de endereço
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario) { (detalhesLocal, erro) in
            
            if erro == nil {
                
              //  let dadosLocal = detalhesLocal?.first
                
                if let dadosLocal = detalhesLocal?.first{
                    
                    var thoroughfare = ""
                    if dadosLocal.thoroughfare != nil {
                        thoroughfare = dadosLocal.thoroughfare!
                    }
                    
                    var subThoroughfare = ""
                    if dadosLocal.subThoroughfare != nil {
                        subThoroughfare = dadosLocal.subThoroughfare!
                    }
                    
                    var locality = ""
                    if dadosLocal.locality != nil {
                        locality = dadosLocal.locality!
                    }
                    
                    var subLocality = ""
                    if dadosLocal.subLocality != nil {
                        subLocality = dadosLocal.subLocality!
                    }
                    
                    var postalCode = ""
                    if dadosLocal.postalCode != nil {
                        postalCode = dadosLocal.postalCode!
                    }
                    
                    var country = ""
                    if dadosLocal.country != nil {
                        country = dadosLocal.country!
                    }
                    
                    var administrativeArea = ""
                    if dadosLocal.administrativeArea != nil {
                        administrativeArea = dadosLocal.administrativeArea!
                    }
                    
                    var subAdministrativeArea = ""
                    if dadosLocal.subAdministrativeArea != nil {
                        subAdministrativeArea = dadosLocal.subAdministrativeArea!
                    }
                    
                    self.enderecoLabel.text =  thoroughfare + " - "
                                                + subThoroughfare + " / "
                                                + locality + "/ "
                                                + country
                    
                    print (
                        
                        "\n / thoroughfare:" + thoroughfare +
                        "\n / subthoroughfare:" + subThoroughfare +
                        "\n / locality:" + locality +
                        "\n / subLocality:" + subLocality +
                        "\n / postalCode:" + postalCode +
                        "\n / country:" + country +
                        "\n / administrativeArea:" + administrativeArea +
                        "\n / subAdministrativeArea:" + subAdministrativeArea
                        
                    )
                }
                
            }else {
               
                let alertaErro = UIAlertController(title: "Erro", message: "Não foi possível exibir o endereço", preferredStyle: .alert)
                let botaoOk = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertaErro.addAction(botaoOk)
                
            }
        }
        
        
    }
    
    //verificando se o usuário autorizou o acesso a localização
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse{
            
           // print("Não autorizado")
            let alertaController = UIAlertController(title: "Permissão de Localização", message: "Necessário permissão para acesso à sua localização! Por favor habilite.", preferredStyle: .alert)
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir Configurações", style: .default, handler: { (alertaConfiguracoes) in
              
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString ){
                    UIApplication.shared.open( configuracoes as URL)
                    
                    
                }
            })
           
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertaController.addAction( acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            
            present(alertaController, animated: true, completion: nil)
            
        }
    }


}


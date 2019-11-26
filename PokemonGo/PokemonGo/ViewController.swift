//
//  ViewController.swift
//  PokemonGo
//
//  Created by Thais Costa on 14/11/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

  @IBOutlet weak var mapa: MKMapView!
  var gerenciadorLocalizacao = CLLocationManager()
  var contador = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    mapa.delegate = self
    gerenciadorLocalizacao.delegate = self
    gerenciadorLocalizacao.requestWhenInUseAuthorization()
    gerenciadorLocalizacao.startUpdatingLocation()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    //Exibir Pokemons
    Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in

      print("Exibe anotacao")
      if let coordenadas = self.gerenciadorLocalizacao.location?.coordinate {
        let anotacao = MKPointAnnotation()
        let latAleatoria = (Double(arc4random_uniform(300)) - 200) / 100000.0
        let longAleatoria = (Double(arc4random_uniform(300)) - 200) / 100000.0

        anotacao.coordinate = coordenadas
        anotacao.coordinate.latitude += latAleatoria
        anotacao.coordinate.longitude += longAleatoria

        self.mapa.addAnnotation(anotacao)
      }

      //Negando autorização de Localização
      if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
        let alertcontroller = UIAlertController(title: "Permisão de localização", message: "Gostaria de ativar sua localização para caçar Pokemons?", preferredStyle: .alert)

        let acaoConfiguracoes = UIAlertAction(title: "Ajustes", style: .default) { _ in
          UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }

        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .destructive)

        alertcontroller.addAction(acaoConfiguracoes)
        alertcontroller.addAction(acaoCancelar)

        self.present(alertcontroller, animated: true)
      }
    }
  }

  @IBAction func centralizarJogador() {
    if let coordenadas = gerenciadorLocalizacao.location?.coordinate {
      let regiao = MKCoordinateRegion(center: coordenadas, latitudinalMeters: 200, longitudinalMeters: 200)
      mapa.setRegion(regiao, animated: true)
    }
  }

  @IBAction func abrirPokedex(_ sender: Any) {
  }

  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //Centraliza o usuário no mapa
    if contador < 3 {
      centralizarJogador()
      contador += 1
    } else {
      gerenciadorLocalizacao.stopUpdatingLocation()
    }
  }
}

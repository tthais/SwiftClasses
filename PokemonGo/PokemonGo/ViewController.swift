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

  override func viewDidLoad() {
    super.viewDidLoad()

    mapa.delegate = self
    gerenciadorLocalizacao.delegate = self
    gerenciadorLocalizacao.requestWhenInUseAuthorization()
    gerenciadorLocalizacao.startUpdatingLocation()
  }
  //Negando autorização de Localização
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
      let alertcontroller = UIAlertController(title: "Permisão de localização", message: "Gostaria de ativar sua localização para caçar Pokemons?", preferredStyle: .alert)

      let acaoConfiguracoes = UIAlertAction(title: "Ajustes", style: .default) { _ in
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
      }

      let acaoCancelar = UIAlertAction(title: "Cancelar", style: .destructive)

      alertcontroller.addAction(acaoConfiguracoes)
      alertcontroller.addAction(acaoCancelar)

      present(alertcontroller, animated: true)
    }
  }
}

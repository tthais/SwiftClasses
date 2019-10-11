//
//  ViewController.swift
//  minhasViagens
//
//  Created by John Lima on 10/10/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

  @IBOutlet weak var mapa: MKMapView!

  var gerenciadorLocalizacao = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    configuraGerenciadorLocalizacao()
  }

  func configuraGerenciadorLocalizacao() {
    gerenciadorLocalizacao.delegate = self
    gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
    gerenciadorLocalizacao.requestWhenInUseAuthorization()
    gerenciadorLocalizacao.startUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status != .authorizedWhenInUse {
      let alertaController = UIAlertController(
        title: "Permissao da localização",
        message: "Necessário permisão para acesso a localização! Por favor habilite.",
        preferredStyle: .alert
      )

      let acaoConfiguracoes = UIAlertAction(title: "Abrir configuraço", style: .default, handler: { acao in
        if let configuracoes = URL(string: UIApplication.openSettingsURLString){
          UIApplication.shared.open(configuracoes)
        }
      })

      let acaocancelar = UIAlertAction(title: "Cancelar", style: .cancel)

      alertaController.addAction(acaoConfiguracoes)
      alertaController.addAction(acaocancelar)

      present(alertaController, animated: true)
    }
  }
}


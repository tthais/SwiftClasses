//
//  ViewController.swift
//  ondeEstou
//
//  Created by John Lima on 06/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

  @IBOutlet weak var mapa: MKMapView!
  @IBOutlet weak var velocidadeLabel: UILabel!
  @IBOutlet weak var latitudeLabel: UILabel!
  @IBOutlet weak var longitudeLabel: UILabel!
  @IBOutlet weak var enderecoLabel: UILabel!

  var gerenciadorLocalizacao = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()
    gerenciadorLocalizacao.delegate = self
    gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
    gerenciadorLocalizacao.requestWhenInUseAuthorization()
    gerenciadorLocalizacao.startUpdatingLocation()
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let localizacaoUsuario = locations.last else { return }

    let areaExibicao = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let regiao = MKCoordinateRegion(center: localizacaoUsuario.coordinate, span: areaExibicao)
    let speed = localizacaoUsuario.speed

    CLGeocoder().reverseGeocodeLocation(localizacaoUsuario) { local, erro in
      guard let endereco = local?.first else { return }
      self.enderecoLabel.text = """
      \(endereco.thoroughfare ?? ""), \(endereco.subThoroughfare ?? "") \(endereco.subLocality ?? "")
      \(endereco.locality ?? "") - \(endereco.administrativeArea ?? "")
      \(endereco.country ?? "")
      """
    }

    velocidadeLabel.text = speed > 0 ? speed.description : "0.0"
    latitudeLabel.text = "Latitude: \(localizacaoUsuario.coordinate.latitude)"
    longitudeLabel.text = "Longitude: \(localizacaoUsuario.coordinate.longitude)"

    mapa.setRegion(regiao, animated: true)
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


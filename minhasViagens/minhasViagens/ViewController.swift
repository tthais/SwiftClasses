//
//  ViewController.swift
//  minhasViagens
//
//  Created by Thais Costa on 10/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

  @IBOutlet weak var mapa: MKMapView!

  var gerenciadorLocalizacao = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    configuraGerenciadorLocalizacao()

    //Quando o Usuário pressionar no  mapa, irá criar um localizador: reconhecer toques na tela

    let reconhecerGesto = UILongPressGestureRecognizer(target: self, action: #selector(marcar(gesture:)))
    reconhecerGesto.minimumPressDuration = 1

    mapa.addGestureRecognizer(reconhecerGesto)
  }

  @objc func marcar(gesture: UIGestureRecognizer) {
    if gesture.state == .began {

      //Recupera as cordenadas do ponto selecionado
      let pontoSelecionado = gesture.location(in: self.mapa)
      let coordenadas = mapa.convert(pontoSelecionado, toCoordinateFrom: mapa)
      let location = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)

      //Recupera endereço do ponto selecionado
      CLGeocoder().reverseGeocodeLocation(location) { local, error in
        guard let endereco = local?.first else { return }

        //Exibe anotação com os dados de endereço
        let anotacao = MKPointAnnotation()
        anotacao.coordinate = coordenadas
        anotacao.title = endereco.locality
        anotacao.subtitle = endereco.subLocality

        self.mapa.addAnnotation(anotacao)
      }
    }
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


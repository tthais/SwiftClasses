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
  var local: ArmazenamentoDados.Dict = [:]
  var indiceSelecionado: Int?

  override func viewDidLoad() {
    super.viewDidLoad()



    if indiceSelecionado != nil {
      adiciona(viagem: local)
    } else { 
      configuraGerenciadorLocalizacao()
    }

    //Quando o Usuário pressionar no  mapa, irá criar um localizador: reconhecer toques na tela

    let reconhecerGesto = UILongPressGestureRecognizer(target: self, action: #selector(marcar(gesture:)))
    reconhecerGesto.minimumPressDuration = 1

    mapa.addGestureRecognizer(reconhecerGesto)
  }

  func adiciona(viagem: ArmazenamentoDados.Dict) {
    let local = viagem["local"] as? String
    let latitude = Double(viagem["latitude"] as? String ?? "0")
    let longitude = Double(viagem["longitude"] as? String ?? "0")

    guard let lat = latitude, let lon = longitude else { return }

    //Exibe anotação com os dados de endereço
    let anotacao = MKPointAnnotation()
    anotacao.coordinate.latitude = lat
    anotacao.coordinate.longitude = lon
    anotacao.title = local

    mapa.addAnnotation(anotacao)
    mapa.mapType = .satellite

    configura(regiao: anotacao.coordinate)
  }

  func configura(regiao: CLLocationCoordinate2D) {
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    let regiao = MKCoordinateRegion(center: regiao, span: span)

    mapa.setRegion(regiao, animated: true)
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

        let local = endereco.locality ?? endereco.country ?? "-"

        let viagem: [String: Any] = [
          "local": local,
          "latitude": "\(coordenadas.latitude)",
          "longitude": "\(coordenadas.longitude)"
        ]

        ArmazenamentoDados().salvar(viagem: viagem)

        self.adiciona(viagem: viagem)
      }
    }
  }

  func configuraGerenciadorLocalizacao() {
    gerenciadorLocalizacao.delegate = self
    gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
    gerenciadorLocalizacao.requestWhenInUseAuthorization()
    gerenciadorLocalizacao.startUpdatingLocation()
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let local = locations.last!
    configura(regiao: local.coordinate)
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


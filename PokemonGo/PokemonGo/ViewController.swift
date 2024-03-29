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
  var coreDataPokemon: CoreDataPokemon!
  var pokemons: [Pokemon] = []


  override func viewDidLoad() {
    super.viewDidLoad()

    mapa.delegate = self
    gerenciadorLocalizacao.delegate = self
    gerenciadorLocalizacao.requestWhenInUseAuthorization()
    gerenciadorLocalizacao.startUpdatingLocation()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    //Recuperar pokemons
    self.coreDataPokemon = CoreDataPokemon()
    self.pokemons = self.coreDataPokemon.recuperarTodosPokemons ()

    //Exibir Pokemons
    Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in

      if let coordenadas = self.gerenciadorLocalizacao.location?.coordinate {

        let totalPokemons = UInt32(self.pokemons.count)
        let indicePokemonAleatorio = arc4random_uniform(totalPokemons)

        let pokemon = self.pokemons [Int (indicePokemonAleatorio)]

        let anotacao = PokemonAnotacao(coordenadas: coordenadas, pokemon: pokemon)
        
        let latAleatoria = (Double(arc4random_uniform(300)) - 200) / 100000.0
        let longAleatoria = (Double(arc4random_uniform(300)) - 200) / 100000.0

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

  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

    let anotacaoView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)

    
    if annotation is MKUserLocation {
      anotacaoView.image = #imageLiteral(resourceName: "player-1")
    }else{
      let pokemon = (annotation as! PokemonAnotacao).pokemon

      anotacaoView.image = UIImage(named: pokemon.nomeImagem!)
    }

    var frame = anotacaoView.frame
    frame.size.height = 40
    frame.size.width = 40
    anotacaoView.frame = frame

    return anotacaoView
  }
}

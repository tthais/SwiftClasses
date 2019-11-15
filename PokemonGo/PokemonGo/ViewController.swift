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
}

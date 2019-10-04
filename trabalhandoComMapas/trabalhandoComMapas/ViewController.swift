//
//  ViewController.swift
//  trabalhandoComMapas
//
//  Created by Thais  Costa on 03/10/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

  @IBOutlet weak var mapa: MKMapView!

  override func viewDidLoad() {
    super.viewDidLoad()

    let latitude: CLLocationDegrees = -23.586974
    let longitude: CLLocationDegrees = -46.657355

    let deltaLatitude: CLLocationDegrees = 0.01
    let deltaLongitude: CLLocationDegrees = 0.01

    let localizacao = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let areaVisualizacao = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)

    let regiao = MKCoordinateRegion(center: localizacao, span: areaVisualizacao)


    mapa.setRegion(regiao, animated: true)

  }


}


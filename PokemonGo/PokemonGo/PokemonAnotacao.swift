//
//  PokemonAnotacao.swift
//  PokemonGo
//
//  Created by Thais Costa on 05/12/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit
import MapKit

class PokemonAnotacao: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D
  var pokemon: Pokemon


  init(coordenadas: CLLocationCoordinate2D, pokemon: Pokemon) {
    self.coordinate = coordenadas
    self.pokemon = pokemon
  }
}

//
//  PokeAnnotation.swift
//  Pokemon_go_clone
//
//  Created by Dylan on 3/1/17.
//  Copyright © 2017 Dylan Grozdanich. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class PokeAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coord: CLLocationCoordinate2D, pokemon: Pokemon){
        self.coordinate = coord
        self.pokemon = pokemon
    
    }
}

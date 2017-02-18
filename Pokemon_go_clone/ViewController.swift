//
//  ViewController.swift
//  Pokemon_go_clone
//
//  Created by Dylan Grozdanich on 2/17/17.
//  Copyright © 2017 Dylan Grozdanich. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("Ready to Go")
            mapView.showsUserLocation = true
        } else {
            manager.requestWhenInUseAuthorization()
        }
        
        
        
        
        
        
        
    }

}


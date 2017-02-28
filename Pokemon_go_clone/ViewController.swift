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
    
    var updateCount = 0
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllPokemon()
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("Ready to Go")
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (Timer) in
                // Spawn a Pokemon
                if let coord = self.manager.location?.coordinate{
                let anno = MKPointAnnotation()
                
                anno.coordinate = coord
                let randoLat = (Double(arc4random_uniform(200)) - 100.0) / 500000.0
                    
                let randoLon = (Double(arc4random_uniform(200)) - 100) / 500000.0
                    
    
                anno.coordinate.latitude += randoLat
                anno.coordinate.longitude += randoLon
                    
                   self.mapView.addAnnotation(anno)
                }
            })
            
            
            
        } else {
            manager.requestWhenInUseAuthorization()
          
        }
    }
    
        func locationManager(_ manager: CLLocationManager, didUpdateLocations: [CLLocation]){
            
            if updateCount < 3 {
                let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 300, 300)
                mapView.setRegion(region, animated: false)
                updateCount += 1
            }else{
                manager.stopUpdatingLocation()
            }
    
            }
    @IBAction func centerTapped(_ sender: Any) {
        if let coord = manager.location?.coordinate{
        let region = MKCoordinateRegionMakeWithDistance(coord, 300, 300)
        mapView.setRegion(region, animated: true)
    }
 
            
        }

}

        





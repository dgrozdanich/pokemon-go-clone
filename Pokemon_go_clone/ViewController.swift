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
        // Do any additional setup after loading the view, typically from a nib.
        
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("Ready to Go")
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
        } else {
            manager.requestWhenInUseAuthorization()
          
        }
    }
    
        func locationManager(_ manager: CLLocationManager, didUpdateLocations: [CLLocation]){
            
            if updateCount < 3 {
                let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 100, 100)
                mapView.setRegion(region, animated: false)
                updateCount += 1
            }else{
                manager.stopUpdatingLocation()
            }
    
            }
 
            
        }

        
        
        





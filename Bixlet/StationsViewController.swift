//
//  StationsViewController.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-17.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import UIKit
import MapKit

class StationsViewController:UIViewController {
    let locationManager:CLLocationManager
    let mapController:StationsMapController
    let mapDelegate:StationsMapDelegate
    
    @IBOutlet weak var mapView: MKMapView!
    
    required init?(coder aDecoder: NSCoder) {
        self.locationManager = CLLocationManager()
        self.mapController = StationsMapController(mapView: nil)
        self.mapDelegate = StationsMapDelegate(mapController: self.mapController)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        self.mapController.mapView = self.mapView
        self.mapView.delegate = self.mapDelegate
        self.locationManager.delegate = self.mapDelegate
        self.locationManager.requestWhenInUseAuthorization()
        self.mapController.showInitialLocation(false)
    }
}

//
//  MapViewController.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-17.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import UIKit
import MapKit

class MapViewController:UIViewController {
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        self.mapView.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.showInitialLocation()
    }
    
    func showInitialLocation() {
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let location = CLLocation(latitude: 43.7000, longitude: -79.4000)
        let region = MKCoordinateRegion(
            center: location.coordinate,
            span: span
        )
        self.mapView.setRegion(region, animated: true)
    }
    
    func showUserLocation() {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(
            center: self.mapView.userLocation.coordinate,
            span: span
        )
        self.mapView.setRegion(region, animated: true)
    }
}

extension MapViewController:MKMapViewDelegate {
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        self.showUserLocation()
    }
}

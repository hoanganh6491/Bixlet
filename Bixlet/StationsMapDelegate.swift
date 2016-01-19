//
//  StationsMapDelegate.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-18.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import UIKit
import MapKit

class StationsMapDelegate:NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
    let mapController:StationsMapController
    
    init(mapController:StationsMapController) {
        self.mapController = mapController
        super.init()
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        self.mapController.showUserLocation(true)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            self.mapController.showUserLocation(true)
        case .Denied, .NotDetermined, .Restricted:
            break
        }
    }
}

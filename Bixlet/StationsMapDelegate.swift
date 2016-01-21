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
    var firstUserLocationFound:Bool = false
    
    init(mapController:StationsMapController) {
        self.mapController = mapController
        super.init()
    }
    
    func mapViewDidFinishLoadingMap(mapView: MKMapView) {
        self.mapController.showInitialLocation(false)
    }
    
    func mapView(mapView: MKMapView, didFailToLocateUserWithError error: NSError) {
        print("ERROR: Failed to locate user. \(error.localizedDescription)")
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        self.mapController.showUserLocation(true)
        self.firstUserLocationFound = true
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

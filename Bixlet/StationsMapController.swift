//
//  StationsMapController.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-18.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import UIKit
import MapKit

class StationsMapController:NSObject, MKMapViewDelegate {
    var mapView:MKMapView?
    var stations:[Station] = [] {
        didSet {
            print("WORKED")
        }
    }
    
    struct LocationConstants {
        static let InitialLatitude = 43.7000
        static let InitialLongitude = -79.4000
    }
    
    init(mapView:MKMapView?) {
        self.mapView = mapView
        super.init()
    }
    
    func showInitialLocation(animated:Bool) {
        if let map = self.mapView {
            let span = MKCoordinateSpanMake(0.3, 0.3)
            let location = CLLocation(
                latitude: LocationConstants.InitialLatitude,
                longitude: LocationConstants.InitialLongitude
            )
            let region = MKCoordinateRegion(
                center: location.coordinate,
                span: span
            )
            map.setRegion(region, animated: animated)
        }
    }
    
    func showUserLocation(animated:Bool) {
        if let map = self.mapView {
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegion(
                center: map.userLocation.coordinate,
                span: span
            )
            map.setRegion(region, animated: animated)
        }
    }
}

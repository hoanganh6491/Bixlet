//
//  StationsMapController.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-18.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import UIKit
import MapKit

class StationAnnotation:NSObject, MKAnnotation {
    let title:String?
    let latitude:Double
    let longitude:Double
    
    var coordinate:CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    init(title: String?, latitude: Double, longitude: Double) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
    }
}

class StationsMapController:NSObject, MKMapViewDelegate {
    var mapView:MKMapView?
    var stations:[Station] = [] {
        didSet {
            self.displayStations()
        }
    }
    
    struct LocationConstants {
        static let InitialLatitude = 43.656866
        static let InitialLongitude = -79.384230
    }
    
    init(mapView:MKMapView?) {
        self.mapView = mapView
        super.init()
    }
    
    func showInitialLocation(animated:Bool) {
        if let map = self.mapView {
            let span = MKCoordinateSpanMake(0.05, 0.05)
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
    
    func displayStations() {
        if let map = self.mapView {
            map.removeAnnotations(map.annotations)
            
            for station in self.stations {
                let annotation = StationAnnotation(
                    title: station.stationName,
                    latitude: station.latitude,
                    longitude: station.longitude
                )
                map.addAnnotation(annotation)
            }
        }
    }
}

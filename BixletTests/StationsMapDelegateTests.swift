//
//  StationsMapDelegateTests.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-18.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import UIKit
import MapKit
@testable import Bixlet
import XCTest

class MockMapController:StationsMapController {
    var didCallShowUserLocation:Bool = false
    
    override func showUserLocation(animated: Bool) {
        super.showUserLocation(animated)
        
        self.didCallShowUserLocation = true
    }
}

class StationsMapDelegateTests:BixletTestCase {
    func testThatAlwaysAuthCallsShowUserLocation() {
        let mapView = MKMapView(frame: CGRectMake(0,0,600,400))
        let mockController = MockMapController(mapView: mapView)
        let mapDelegate = StationsMapDelegate(mapController: mockController)
        
        mapDelegate.locationManager(CLLocationManager(), didChangeAuthorizationStatus: .AuthorizedAlways)
        XCTAssertTrue(mockController.didCallShowUserLocation)
    }
    
    func testThatInUseAuthCallsShowUserLocation() {
        let mapView = MKMapView(frame: CGRectMake(0,0,600,400))
        let mockController = MockMapController(mapView: mapView)
        let mapDelegate = StationsMapDelegate(mapController: mockController)
        
        mapDelegate.locationManager(CLLocationManager(), didChangeAuthorizationStatus: .AuthorizedWhenInUse)
        XCTAssertTrue(mockController.didCallShowUserLocation)
    }
    
    func testThatDeniedDoesNotCallShowUserLocation() {
        let mapView = MKMapView(frame: CGRectMake(0,0,600,400))
        let mockController = MockMapController(mapView: mapView)
        let mapDelegate = StationsMapDelegate(mapController: mockController)
    
        mapDelegate.locationManager(CLLocationManager(), didChangeAuthorizationStatus: .Denied)
        XCTAssertFalse(mockController.didCallShowUserLocation)
    }
    
    func testThatNotDeterminedDoesNotCallShowUserLocation() {
        let mapView = MKMapView(frame: CGRectMake(0,0,600,400))
        let mockController = MockMapController(mapView: mapView)
        let mapDelegate = StationsMapDelegate(mapController: mockController)

        mapDelegate.locationManager(CLLocationManager(), didChangeAuthorizationStatus: .NotDetermined)
        XCTAssertFalse(mockController.didCallShowUserLocation)
    }
    
    func testThatRestrictedDoesNotCallShowUserLocation() {
        let mapView = MKMapView(frame: CGRectMake(0,0,600,400))
        let mockController = MockMapController(mapView: mapView)
        let mapDelegate = StationsMapDelegate(mapController: mockController)
        
        mapDelegate.locationManager(CLLocationManager(), didChangeAuthorizationStatus: .Restricted)
        XCTAssertFalse(mockController.didCallShowUserLocation)
    }
}

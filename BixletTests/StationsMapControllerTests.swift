//
//  StationsMapControllerTests.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-18.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import UIKit
import MapKit
@testable import Bixlet
import XCTest

class StationsMapControllerTests:BixletTestCase {
    func testThatItShowsInitialLocation() {
        let mapView = MKMapView(frame: CGRectMake(0,0,600,400))
        let mapController = StationsMapController(mapView: mapView)
        
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let location = CLLocation(
            latitude: StationsMapController.LocationConstants.InitialLatitude,
            longitude: StationsMapController.LocationConstants.InitialLongitude
        )
        let expectedRegion = MKCoordinateRegion(
            center: location.coordinate,
            span: span
        )
        
        mapController.showInitialLocation(false)
        if let map = mapController.mapView {
            let expectedLatitude = expectedRegion.center.latitude
            let mapLatitude = map.region.center.latitude
            let expectedLongitude = expectedRegion.center.longitude
            let mapLongitude = map.region.center.longitude
            XCTAssertEqual(round(expectedLatitude), round(mapLatitude))
            XCTAssertEqual(round(expectedLongitude), round(mapLongitude))
        } else {
            XCTFail("Expected mapController to have a map.")
        }
    }
}

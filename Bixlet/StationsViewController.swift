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
    let client:Client = Client()
    let parser:StationsParser = StationsParser()
    
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
        self.fetchStations()
    }
    
    private func fetchStations() {
        self.client.fetchStations { result in
            switch result {
            case .Failure(let error):
                print("ERROR: Failed to fetch Stations. \(error)")
                return
            case .Success(let data):
                if let stations = self.parser.stationModels(data) {
                    self.mapController.stations = stations
                } else {
                    print("ERROR: Expected to parse an array of Station models.")
                }
            }
        }
    }
}

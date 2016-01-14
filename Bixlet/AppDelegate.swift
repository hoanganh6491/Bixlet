//
//  AppDelegate.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-10.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Client().fetchStations { (result) in
            switch(result) {
            case .Failure(let error):
                print("ERROR: Failed to fetch Stations. \(error)")
            case .Success(let data):
                let stations = StationsParser().stationModels(data)
                print("Stations: \(stations)")
            }
        }
        
        return true
    }

}


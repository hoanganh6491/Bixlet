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
        
        Client().fetchStations { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let error = error {
                print("ERROR: Failed to fetch Stations. \(error)")
                return
            } else {
                print("IT WORKED")
            }
        }
        
        return true
    }

}


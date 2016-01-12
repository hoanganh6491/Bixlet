//
//  Client.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-11.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation

class Client: NSObject {
    static let BaseURL = NSURL(string: "http://www.bikesharetoronto.com/stations/json")!
    typealias ClientResult = (NSData?, NSURLResponse?, NSError?) -> Void
    
    func fetchStations(completion: ClientResult) {
        NSURLSession.sharedSession().dataTaskWithURL(Client.BaseURL, completionHandler: completion).resume()
    }
}

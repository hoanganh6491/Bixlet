//
//  Client.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-11.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation

class Client: NSObject {
    static let StationsURL = NSURL(string: "http://www.bikesharetoronto.com/stations/json")!
    typealias CompletionHandler = (ClientResult) -> Void
    
    func fetchStations(completion: CompletionHandler) {
        NSURLSession.sharedSession().dataTaskWithURL(Client.StationsURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if let e = error {
                    completion(.Failure(ClientError.UnknownError(e)))
                } else {
                    if let d = data {
                        completion(.Success(d))
                    } else {
                        completion(.Failure(ClientError.NoData))
                    }
                }
            })
        }.resume()
    }
}

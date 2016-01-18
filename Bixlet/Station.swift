//
//  Station.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-10.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation
import Argo
import Curry
import MapKit

struct Station {
    let altitude: String?
    let availableBikes: Int
    let availableDocks: Int
    let city:String?
    let id: Int
    let landMark: Int
    let lastCommunicationTime: NSDate
    let latitude: Double
    let location: String?
    let longitude: Double
    let postalCode: String?
    let stAddress1: String?
    let stAddress2: String?
    let stationName: String
    let statusKey: Int
    let statusValue: String
    let testStation: Bool
    let totalDocks: Int
}

extension Station: Decodable {
    static func decode(j: JSON) -> Decoded<Station> {
        let f = curry(Station.init)
            <^> j <|?   "altitude"
            <*> j <|    "availableBikes"
            <*> j <|    "availableDocks"
            <*> j <|?   "city"
            <*> j <|    "id"
            <*> j <|    "landMark"
        return f
            <*> (j <|   "lastCommunicationTime" >>- toNSDate)
            <*> j <|    "latitude"
            <*> j <|?   "location"
            <*> j <|    "longitude"
            <*> j <|?   "postalCode"
            <*> j <|?   "stAddress1"
            <*> j <|?   "stAddress2"
            <*> j <|    "stationName"
            <*> j <|    "statusKey"
            <*> j <|    "statusValue"
            <*> j <|    "testStation"
            <*> j <|    "totalDocks"
    }
}

let toNSDate: String -> Decoded<NSDate> = {
    .fromOptional(StationDateFormatter().dateFromString($0))
}

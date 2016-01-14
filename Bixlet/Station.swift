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

struct Station {
    let availableBikes: Int
    let availableDocks: Int
    let id: Int
    let landMark: Int
    let latitude: Double
    let longitude: Double
    let stationName: String
    let statusKey: Int
    let statusValue: String
    let testStation: Bool
    let totalDocks: Int
}

extension Station: Decodable {
    static func decode(j: JSON) -> Decoded<Station> {
        let f = curry(Station.init)
            <^> j <| "availableBikes"
            <*> j <| "availableDocks"
            <*> j <| "id"
            <*> j <| "landMark"
        return f
            <*> j <| "latitude"
            <*> j <| "longitude"
            <*> j <| "stationName"
            <*> j <| "statusKey"
            <*> j <| "statusValue"
            <*> j <| "testStation"
            <*> j <| "totalDocks"
    }
}

let jsonDateFormatter: NSDateFormatter = {
    let dateFormatter = NSDateFormatter()
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss' 'a" // 2016-01-11 20:40:57 PM
    return dateFormatter
}()

let toNSDate: String -> Decoded<NSDate> = {
    .fromOptional(jsonDateFormatter.dateFromString($0))
}

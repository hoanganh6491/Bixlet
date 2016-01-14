//
//  StationsParser.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-13.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation
import Argo

class StationsParser: NSObject {
    func stationModels(data: NSData) -> [Station]? {
        let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
        if let j = json {
            let stations: [Station]? = decodeWithRootKey("stationBeanList", j)
            if let s = stations {
                return s
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}

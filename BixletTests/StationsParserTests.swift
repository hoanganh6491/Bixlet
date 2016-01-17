//
//  StationsParserTests.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-17.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation
@testable import Bixlet
import XCTest

class StationsParserTests:BixletTestCase {
    func testParsingStations() {
        let stationsData = self.dataFromFixture("stations")
        let parser = StationsParser()
        
        if let stations = parser.stationModels(stationsData) {
            XCTAssertEqual(stations.count, 80)
            let s = stations[0]
            XCTAssertEqual(s.id, 1)
            XCTAssertEqual(s.stationName, "Jarvis St / Carlton St")
            XCTAssertEqual(s.availableBikes, 4)
            XCTAssertEqual(s.availableDocks, 10)
            XCTAssertEqual(s.totalDocks, 14)
        } else {
            XCTFail("Expected an array of Station models.")
        }
    }
    
    func testParsingBadData() {
        let data = NSData()
        let parser = StationsParser()
        
        let result = parser.stationModels(data)
        XCTAssertNil(result)
    }
}

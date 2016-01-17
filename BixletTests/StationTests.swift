//
//  StationTests.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-16.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import XCTest
@testable import Bixlet
import Argo

class StationTests: XCTestCase {
    func fixtureData() -> NSData {
        let path = NSBundle(forClass: self.dynamicType).pathForResource("stations", ofType: "json")!
        let data = NSData(contentsOfFile: path)!
        return data
    }
    
    func fixtureJSON() -> AnyObject? {
        let json = try? NSJSONSerialization.JSONObjectWithData(self.fixtureData(), options: [])
        return json
    }
    
    func testStation() -> Station? {
        if let  fixtureJSON = self.fixtureJSON(),
                stations:[Station] = decodeWithRootKey("stationBeanList", fixtureJSON) {
            return stations[0]
        } else {
            return nil
        }
    }
    
    func testBasicProperties() {
        if let s:Station = self.testStation() {
            XCTAssertNil(s.altitude)
            XCTAssertEqual(s.availableBikes, 4)
            XCTAssertEqual(s.availableDocks, 10)
            XCTAssertNil(s.city)
            XCTAssertEqual(s.id, 1)
            XCTAssertEqual(s.landMark, 7055)
            XCTAssertEqual(s.latitude, 43.66207)
            XCTAssertNil(s.location)
            XCTAssertEqual(s.longitude, -79.37617)
            XCTAssertNil(s.postalCode)
            XCTAssertNil(s.stAddress1)
            XCTAssertNil(s.stAddress2)
            XCTAssertEqual(s.stationName, "Jarvis St / Carlton St")
            XCTAssertEqual(s.statusKey, 1)
            XCTAssertEqual(s.statusValue, "In Service")
            XCTAssertFalse(s.testStation)
            XCTAssertEqual(s.totalDocks, 14)
        } else {
            XCTFail("Expected a Station model.")
        }
    }
    
    func testDateProperties() {
        if let s:Station = self.testStation() {
            let lastCommunicationTime = "2016-01-15 22:40:39 PM"
            let expectedDate = StationDateFormatter().dateFromString(lastCommunicationTime)
            
            XCTAssertEqual(s.lastCommunicationTime, expectedDate)
        } else {
            XCTFail("Expected a Station model.")
        }
    }
}

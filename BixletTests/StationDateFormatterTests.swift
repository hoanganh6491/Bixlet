//
//  StationDateFormatterTests.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-17.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import XCTest
@testable import Bixlet

class StationDateFormatterTests:BixletTestCase {
    func testParsingCorrectDateFormat() {
        let lastCommunicationTime = "2016-01-15 22:40:39 PM"
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss' 'a"
        
        let formatterDate = formatter.dateFromString(lastCommunicationTime)
        let stationDate = StationDateFormatter().dateFromString(lastCommunicationTime)
        
        XCTAssertEqual(formatterDate, stationDate)
    }
    
    func testParsingBadDateFormat() {
        let badDateString = "Not a date"
        XCTAssertNil(StationDateFormatter().dateFromString(badDateString))
    }
}

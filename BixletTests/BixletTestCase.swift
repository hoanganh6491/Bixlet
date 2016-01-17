//
//  BixletTestCase.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-17.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation
import XCTest

class BixletTestCase:XCTestCase {
    func dataFromFixture(filename:String) -> NSData {
        let path = NSBundle(forClass: self.dynamicType).pathForResource(filename, ofType: "json")!
        let data = NSData(contentsOfFile: path)!
        return data
    }
    
    func jsonFromFixtureData(data:NSData) -> AnyObject? {
        let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
        return json
    }
}
//
//  StationDateFormatter.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-17.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation

class StationDateFormatter:NSDateFormatter {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        self.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        self.dateFormat = "yyyy-MM-dd' 'HH:mm:ss' 'a" // 2016-01-11 20:40:57 PM
    }
}

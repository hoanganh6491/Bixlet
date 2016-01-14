//
//  ClientError.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-13.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation

public enum ClientError: ErrorType {
    case NoData
    case UnknownError(NSError)
}

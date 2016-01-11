//
//  ClientResult.swift
//  Bixlet
//
//  Created by Brian Gilham on 2016-01-10.
//  Copyright © 2016 Brian Gilham. All rights reserved.
//

import Foundation
import Argo

public enum ClientResult<T> {
    case Success(T)
    case Error(NSError)
    case NotFound
    case ServerError(Int)
    case ClientError(Int)
    case UnexpectedResponse(JSON)
}

//
//  Alamofire+HTTPMethod.swift
//  NetworkKit
//
//  Created by Ofir Ron on 10/02/2025.
//

import Foundation
import Alamofire

extension Alamofire.HTTPMethod {
    init(_ method: HTTPMethod) {
        switch method {
            case .get:    self = .get
            case .post:   self = .post
            case .put:    self = .put
        }
    }
}

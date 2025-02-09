//
//  NetworkRequest.swift
//  NetworkKit
//
//  Created by Ofir Ron on 31/12/2024.
//

import Foundation
import FoundationCoreKit

public protocol NetworkRequest {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var body: JSON? { get throws }
}

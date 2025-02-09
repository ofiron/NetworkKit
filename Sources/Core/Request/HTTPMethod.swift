//
//  HTTPMethod.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation

/// Represents the HTTP methods supported by the networking layer.
public enum HTTPMethod: String {
    /// The GET method requests a representation of the specified resource.
    case get = "GET"

    /// The POST method submits an entity to the specified resource, often causing a change in state or side effects on the server.
    case post = "POST"

    /// The PUT method replaces all current representations of the target resource with the request payload.
    case put = "PUT"

    // Additional methods can be added as needed
    // case patch = "PATCH"
    // case delete = "DELETE"
    // case head = "HEAD"
    // case options = "OPTIONS"
}

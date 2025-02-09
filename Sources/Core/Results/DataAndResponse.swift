//
//  DataAndResponse.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation

/// Represents a tuple containing the data and response from a network request.
/// This type alias is commonly used in networking layers to return both the raw data and the URL response.
public typealias DataAndResponse = (data: Data, response: URLResponse)

/// Represents HTTP status codes returned by a server.
/// This enum can be extended to include additional status codes as needed.
public enum HTTPStatusCode: Int {
    /// The request was successful (200 OK).
    case ok = 200

    // Additional status codes can be added here, such as:
    // case created = 201
    // case badRequest = 400
    // case unauthorized = 401
    // case notFound = 404
    // case internalServerError = 500
}

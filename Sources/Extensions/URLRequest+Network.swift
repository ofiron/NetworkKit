//
//  URLRequest+Network.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation
import FoundationCoreKit

extension URLRequest {
    /// Initializes a new URLRequest with the specified parameters.
    ///
    /// - Parameters:
    ///   - url: The URL for the request.
    ///   - httpMethod: The HTTP method to use.
    ///   - headers: The HTTP headers to include in the request.
    ///   - body: The JSON body to include in the request.
    ///   - authorizationType: The authorization type to use for the request.
    public init(
        url: URL,
        httpMethod: HTTPMethod = .get,
        headers: HTTPHeaders? = nil,
        body: JSON? = nil,
        authorizationType: AuthorizationType? = nil
    ) {
        // Initialize with the URL
        self = URLRequest(url: url)
        
        // Merge provided headers with authorization headers (if any)
        var headers = headers ?? [:]
        
        // Add authorization header if provided and not already in headers
        if let authorizationType, headers[authorizationType.headerField] == nil {
            headers[authorizationType.headerField] = authorizationType.headerValue
        }
        
        // Set the headers for the request
        if headers.isEmpty == false {
            for header in headers {
                setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        // Set the request body if provided
        if let body {
            self.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        // Set the HTTP method for the request
        self.httpMethod = httpMethod.rawValue
    }
}

//
//  NetworkConfiguration.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation

/// A configuration struct for network requests.
/// This struct provides the base URL and authorization type required for making network requests.
public struct NetworkConfiguration: ConfigurationProviding {
    /// The base URL for the network requests.
    public let baseURL: URL
    
    /// The authorization type to use for the network requests.
    public let authorization: AuthorizationType?
    
    /// Initializes a `NetworkConfiguration` with the specified base URL and authorization type.
    /// - Parameters:
    ///   - baseURL: The base URL for the network requests.
    ///   - authorization: The authorization type to use for the network requests. Defaults to `nil`.
    public init(baseURL: URL, authorization: AuthorizationType?) {
        self.baseURL = baseURL
        self.authorization = authorization
    }
}

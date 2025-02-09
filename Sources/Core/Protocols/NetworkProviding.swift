//
//  NetworkProviding.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation
import FoundationCoreKit

/// A protocol that defines the interface for a network provider.
/// Conforming types can fetch data from a URL or a `NetworkRequest` and return either raw `Data` or a tuple of `Data` and `URLResponse`.
public protocol NetworkProviding: Providing {
    /// Fetches data from the specified URL.
    /// - Parameter url: The URL to fetch data from.
    /// - Returns: The raw `Data` from the response.
    /// - Throws: An error if the request fails.
    func data(from url: URL) async throws -> Data
    
    /// Fetches data from the specified `NetworkRequest`.
    /// - Parameter request: The `NetworkRequest` to fetch data from.
    /// - Returns: The raw `Data` from the response.
    /// - Throws: An error if the request fails.
    func data(from request: NetworkRequest) async throws -> Data
    
    /// Fetches data from the specified URL using the provided HTTP method, body, and headers.
    /// - Parameters:
    ///   - url: The URL to fetch data from.
    ///   - method: The HTTP method to use for the request.
    ///   - body: The JSON body to include in the request. Defaults to `nil`.
    ///   - headers: The HTTP headers to include in the request. Defaults to `nil`.
    /// - Returns: The raw `Data` from the response.
    /// - Throws: An error if the request fails.
    func data(from url: URL, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> Data
    
    /// Fetches data and the response from the specified endpoint.
    /// - Parameter endPoint: The endpoint to fetch data from, conforming to `StringConvertible`.
    /// - Returns: A tuple containing the raw `Data` and the `URLResponse`.
    /// - Throws: An error if the request fails.
    func dataAndResponse(endPoint: StringConvertible) async throws -> DataAndResponse
    
    /// Fetches data and the response from the specified endpoint using the provided HTTP method, body, and headers.
    /// - Parameters:
    ///   - endPoint: The endpoint to fetch data from, conforming to `StringConvertible`.
    ///   - method: The HTTP method to use for the request.
    ///   - body: The JSON body to include in the request. Defaults to `nil`.
    ///   - headers: The HTTP headers to include in the request. Defaults to `nil`.
    /// - Returns: A tuple containing the raw `Data` and the `URLResponse`.
    /// - Throws: An error if the request fails.
    func dataAndResponse(endPoint: StringConvertible, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> DataAndResponse
    
    /// Fetches data and the response from the specified URL using the provided HTTP method, body, and headers.
    /// - Parameters:
    ///   - url: The URL to fetch data from.
    ///   - method: The HTTP method to use for the request.
    ///   - body: The JSON body to include in the request. Defaults to `nil`.
    ///   - headers: The HTTP headers to include in the request. Defaults to `nil`.
    /// - Returns: A tuple containing the raw `Data` and the `URLResponse`.
    /// - Throws: An error if the request fails.
    func dataAndResponse(url: URL, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> DataAndResponse
    
    /// Fetches data and the response from the specified `NetworkRequest`.
    /// - Parameter request: The `NetworkRequest` to fetch data from.
    /// - Returns: A tuple containing the raw `Data` and the `URLResponse`.
    /// - Throws: An error if the request fails.
    func dataAndResponse(from request: NetworkRequest) async throws -> DataAndResponse
}

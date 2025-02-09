//
//  URLSessionNetworkProvider.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation
import FoundationCoreKit

/// A network provider that uses `URLSession` to perform network requests for the 'NetworkProviding'.
open class URLSessionNetworkProvider: ConfigurableNetworkProviding {
    private(set) var configuration: NetworkConfiguration
    
    public required init(configuration: NetworkConfiguration) {
        self.configuration = configuration
    }

    public func configure(with configuration: NetworkConfiguration) {
        self.configuration = configuration
    }
}

extension URLSessionNetworkProvider: NetworkProviding {
    public func data(from url: URL) async throws -> Data {
        try await data(from: url, method: .get, body: nil, headers: nil)
    }
    
    public func data(from request: NetworkRequest) async throws -> Data {
        try await dataAndResponse(from: request).data
    }
    
    public func data(from url: URL, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> Data {
        let dataResponse = try await dataAndResponse(url: url, method: method, body: body, headers: headers)

        guard (dataResponse.1 as? HTTPURLResponse)?.statusCode == HTTPStatusCode.ok.rawValue else {
            throw NotImplementedError("\(type(of: self)) Error while fetching data")
        }

        return dataResponse.0
    }
    
    public func dataAndResponse(endPoint: StringConvertible) async throws -> DataAndResponse {
        try await dataAndResponse(endPoint: endPoint, method: .get, body: nil, headers: nil)
    }
    
    public func dataAndResponse(endPoint: StringConvertible, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> DataAndResponse {
        let url = configuration.baseURL.appending(path: endPoint.toString())
        return try await dataAndResponse(url: url, method: method, body: body, headers: headers)
    }
    
    public func dataAndResponse(url: URL, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> DataAndResponse {
        let urlRequest = URLRequest(url: url, httpMethod: method, headers: headers, body: body, authorizationType: configuration.authorization)
        return try await URLSession.shared.data(for: urlRequest)
    }
    
    public func dataAndResponse(from request: NetworkRequest) async throws -> DataAndResponse {
        let url = try URL(throwing: request.path, relativeTo: configuration.baseURL)
        
        let urlRequest = URLRequest(
            url: url, 
            httpMethod: request.method,
            headers: request.headers,
            body: try request.body,
            authorizationType: configuration.authorization)
        
        return try await URLSession.shared.data(for: urlRequest)
    }
}

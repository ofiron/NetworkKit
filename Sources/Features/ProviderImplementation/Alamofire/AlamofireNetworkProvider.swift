//
//  AlamofireNetworkProvider.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation
import Alamofire
import FoundationCoreKit

/// A network provider that uses `Alamofire` to perform network requests for the 'NetworkProviding'.
open class AlamofireNetworkProvider: ConfigurableNetworkProviding {
    private(set) var configuration: NetworkConfiguration
    
    public required init(configuration: NetworkConfiguration) {
        self.configuration = configuration
    }

    public func configure(with configuration: NetworkConfiguration) {
        self.configuration = configuration
    }
}

extension AlamofireNetworkProvider: NetworkProviding {
    public func data(from url: URL) async throws -> Data {
        try await data(from: url, method: .get, body: nil, headers: nil)
    }
    
    public func data(from request: NetworkRequest) async throws -> Data {
        try await dataAndResponse(from: request).data
    }
    
    public func data(from url: URL, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> Data {
        try await dataAndResponse(url: url, method: method, body: body, headers: headers).data
    }
    
    public func dataAndResponse(endPoint: StringConvertible) async throws -> DataAndResponse {
        try await dataAndResponse(endPoint: endPoint, method: .get, body: nil, headers: nil)
    }
    
    public func dataAndResponse(endPoint: StringConvertible, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> DataAndResponse {
        let url = configuration.baseURL.appending(path: endPoint.toString())
        return try await dataAndResponse(url: url, method: method, body: body, headers: headers)
    }

    public func dataAndResponse(url: URL, method: HTTPMethod, body: JSON?, headers: HTTPHeaders?) async throws -> DataAndResponse {

        let convertedHTTPMethod = Alamofire.HTTPMethod(method)

        var requestHeaders = HTTPHeaders()
        if let authorizationType = configuration.authorization {
            requestHeaders[authorizationType.headerField] = authorizationType.headerValue
        }
        
        requestHeaders.merge(headers ?? [:]) { _, new in
            new
        }

        let convertedHeaders: [Alamofire.HTTPHeader] = requestHeaders.map { Alamofire.HTTPHeader(name: $0.key, value: $0.value) }
        let alamofireHeaders: [Alamofire.HTTPHeader] = convertedHeaders
        let httpHeaders = Alamofire.HTTPHeaders(alamofireHeaders)
        
        let req = AF.request(url, method: convertedHTTPMethod, parameters: body, encoding: JSONEncoding.default, headers: httpHeaders)
            
        return try await withCheckedThrowingContinuation { continuation in
            req.response { dataResponse in                
                switch dataResponse.result {
                    case .success(let data):
                        guard let data else {
                            continuation.resume(throwing: NotImplementedError("AlamofireNetworkProvider failed request, data is nil"))
                            return
                        }
                        
                        guard let httpUrlResponse = dataResponse.response else {
                            continuation.resume(throwing: NotImplementedError("AlamofireNetworkProvider failed request, no http response"))
                            return
                        }
                        
                        let result = DataAndResponse(data, httpUrlResponse)
                        
                        continuation.resume(returning: result)
                        
                    case .failure(let error):
                        
                        continuation.resume(throwing: NotImplementedError("AlamofireNetworkProvider failed request, error: \(error)"))
                }
            }
        }
    }
    
    public func dataAndResponse(from request: NetworkRequest) async throws -> DataAndResponse {
        let convertedHTTPMethod = Alamofire.HTTPMethod(request.method)

        var requestHeaders = HTTPHeaders()
        if let authorizationType = configuration.authorization {
            requestHeaders[authorizationType.headerField] = authorizationType.headerValue
        }
        
        requestHeaders.merge(request.headers ?? [:]) { _, new in
            new
        }
        
        let convertedHeaders: [Alamofire.HTTPHeader] = requestHeaders.map { Alamofire.HTTPHeader(name: $0.key, value: $0.value) }
        let alamofireHeaders: [Alamofire.HTTPHeader] = convertedHeaders
        let httpHeaders = Alamofire.HTTPHeaders(alamofireHeaders)
        
        let url = try URL(throwing: request.path, relativeTo: configuration.baseURL)
        let req = AF.request(url, method: convertedHTTPMethod, parameters: try request.body, encoding: JSONEncoding.default, headers: httpHeaders)

        return try await withCheckedThrowingContinuation { continuation in
            req.response { dataResponse in
                switch dataResponse.result {
                    case .success(let data):
                        guard let data else {
                            continuation.resume(throwing: NotImplementedError("AlamofireNetworkProvider failed request, data is nil"))
                            return
                        }
                        
                        guard let httpUrlResponse = dataResponse.response else {
                            continuation.resume(throwing: NotImplementedError("AlamofireNetworkProvider failed request, no http response"))
                            return
                        }
                        
                        let result = DataAndResponse(data, httpUrlResponse)
                        
                        continuation.resume(returning: result)
                        
                    case .failure(let error):
                        
                        continuation.resume(throwing: NotImplementedError("AlamofireNetworkProvider failed request, error: \(error)"))
                }
            }
        }
    }
}

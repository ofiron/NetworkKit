//
//  AuthorizationType.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation

public enum AuthorizationType {
    /// API key authentication.
    case keyAuthentication(key: String)
    
    /// Bearer token authentication.
    case bearerToken(token: String)
    
    /// OAuth authentication with an access token and refresh token.
    @available(*, deprecated, message: "The oauth case was not tested yet.")
    case oauth(accessToken: String, refreshToken: String)
}

extension AuthorizationType {
    /// Returns the header value for the authorization type.
    public var headerValue: String {
        switch self {
            case .keyAuthentication(let key):
                return key

            case .bearerToken(let token):
                return "Bearer \(token)"

            case .oauth(let accessToken, _):
                // TODO: need to test this
                return "Bearer \(accessToken)"
        }
    }
    
    /// Returns the header field for the authorization type.
    public var headerField: String {
        switch self {
            case .keyAuthentication:
                return "X-API-Key"
                
            case .bearerToken:
                return "Authorization"
            
            case .oauth:
                return "Authorization"
        }
    }
    
    /// Returns the HTTP headers required for the authorization type.
    public var httpAuthorizationHeaders: [String: String] {
        let headers: [String: String] = [
            headerField: headerValue
        ]
        
        return headers
    }
}

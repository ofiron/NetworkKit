//
//  HTTPHeaders-Definitionsr.swift
//  NetworkKit
//
//  Created by Ofir Ron on 11/02/2025.
//

import Foundation

// MARK: - Header Definitions
extension HTTPHeaders {
    /// Standard HTTP header fields
    public enum Header: String {
        /// Content-Type header field
        case contentType = "Content-Type"
        /// Authorization header field
        case authorization = "Authorization"
        /// Accept header field
        case accept = "Accept"
        // Add other standard headers as needed
    }
    
    /// Common content type values
    public enum ContentType: String {
        /// JSON content type (application/json)
        case json = "application/json"
        /// Plain text content type (text/plain)
        case text = "text/plain"
        /// XML content type (application/xml)
        case xml = "application/xml"
        // Add other content types as needed
    }
}

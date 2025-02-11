//
//  HTTPHeaders.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation

/// A type-safe representation of HTTP headers with common header fields and content types.
///
/// Use `HTTPHeaders` to construct and manage HTTP headers in a structured way, supporting both standard
/// headers and custom header fields.
///
/// # Example
/// ```swift
/// // Create headers with JSON content type
/// var headers = HTTPHeaders(contentType: .json)
///
/// // Add custom header
/// headers.add("X-Custom-Header", value: "CustomValue")
///
/// // Add authorization header if not present
/// headers.addIfNotPresent(.authorization, value: "Bearer token")
/// ```
public struct HTTPHeaders {
    /// The underlying storage for header fields
    private var headers: [String: String] = [:]
    
    /// Creates empty HTTP headers
    public init() {}
    
    /// Creates headers with specified content type
    /// - Parameter contentType: The content type to set for the "Content-Type" header
    public init(contentType: ContentType? = nil) {
        if let contentType = contentType {
            self.headers[Header.contentType.rawValue] = contentType.rawValue
        }
    }
    
    // MARK: - Header Management
    
    /// Adds a header using a predefined header field
    /// - Parameters:
    ///   - header: The standardized header field to add
    ///   - value: The value for the header field
    public mutating func add(_ header: Header, value: String) {
        headers[header.rawValue] = value
    }
    
    /// Adds a custom header using a string key
    /// - Parameters:
    ///   - header: The custom header field name
    ///   - value: The value for the header field
    public mutating func add(_ header: String, value: String) {
        headers[header] = value
    }
    
    /// Adds a header only if it doesn't already exist
    /// - Parameters:
    ///   - header: The standardized header field to add
    ///   - value: The value for the header field
    public mutating func addIfNotPresent(_ header: Header, value: String) {
        guard headers[header.rawValue] == nil else { return }
        headers[header.rawValue] = value
    }
    
    /// Adds a custom header only if it doesn't already exist
    /// - Parameters:
    ///   - header: The custom header field name
    ///   - value: The value for the header field
    public mutating func addIfNotPresent(_ header: String, value: String) {
        guard headers[header] == nil else { return }
        headers[header] = value
    }
    
    /// Merge two 'HTTPHeaders'
    /// - Parameters:
    ///   - anotherHeaders: The headers to merge from.
    ///   - useNewValues: In case of duplicate use the new value
    public mutating func merge(_ anotherHeaders: HTTPHeaders?, useNewValues: Bool = true) {
        guard let anotherHeaders else { return }
        headers.merge(anotherHeaders.dictionary) { old, new in
            useNewValues ? new : old
        }
    }
    
    /// Retrieves the value for a specified header field.
    /// - Parameter header: The header field to retrieve the value for.
    /// - Returns: The value of the header field if it exists; otherwise, `nil`.
    public func value(for header: Header) -> String? {
        return headers[header.rawValue]
    }
    
    /// Retrieves the value for a custom header field using a string key.
    /// - Parameter header: The custom header field name to retrieve the value for.
    /// - Returns: The value of the header field if it exists; otherwise, `nil`.
    public func value(for header: String) -> String? {
        return headers[header]
    }
    
    /// Returns the headers as a dictionary
    public var dictionary: [String: String] {
        return headers
    }
}

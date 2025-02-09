//
//  HTTPStatusCode.swift
//  NetworkKit
//
//  Created by Ofir Ron on 10/02/2025.
//

import Foundation

extension HTTPStatusCode {
    /// Indicates whether the HTTP status code represents a successful response.
    /// - Returns: `true` if the status code is successful, otherwise `false`.
    public var isSuccessful: Bool {
        // Successful responses (200 – 299)
        // https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
        switch self {
            case .ok:
                return true
        }
    }
}

//
//  URL+Init.swift
//  NetworkKit
//
//  Created by Ofir Ron on 31/12/2024.
//

import Foundation

extension URL {
    public init(throwing urlString: String) throws {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        self = url
    }
    
    public init(throwing string: String, relativeTo url: URL) throws {
        let relativeUrlString = "\(url.absoluteString)\(string)"
        guard let relativeUrl = URL(string: relativeUrlString) else {
            throw URLError(.badURL)
        }

        self = relativeUrl
        return
    }
}

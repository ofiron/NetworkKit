//
//  ConfigurationProviding.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation

/// A marker protocol for types that provide configuration data.
/// This protocol is used as a base protocol for configuration-related types (e.g., `NetworkConfiguration`).
public protocol ConfigurationProviding {
    // No requirements; this is a marker protocol.
}

//
//public protocol ConfigurationProviding {
//    associatedtype ConfigurationData
////    func configure(with configuration: ConfigurationData)
//    func configure(with configuration: Self)
//}

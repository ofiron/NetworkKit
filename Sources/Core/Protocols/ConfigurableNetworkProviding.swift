//
//  ConfigurableNetworkProviding.swift
//  NetworkKit
//
//  Created by Ofir Ron on 16/01/2025.
//

import Foundation

/// A protocol that defines a network provider that can be initialized and reconfigured with a `NetworkConfiguration`.
/// Conforming types must implement an initializer and a method to update the configuration.
/// This protocol inherits from `NetworkProviding`, so conforming types must also implement the required network methods.
///
/// Use this protocol to create network providers that can be initialized and reconfigured with a specific configuration.
/// For example, `URLSessionNetworkProvider` and `AlamofireNetworkProvider` conform to this protocol.
///
/// ### Example
/// ```swift
/// public struct CustomNetworkProvider: ConfigurableNetworkProviding {
///     private var configuration: NetworkConfiguration
///
///     public init(configuration: NetworkConfiguration) {
///         self.configuration = configuration
///     }
///
///     public func configure(with configuration: NetworkConfiguration) {
///         self.configuration = configuration
///     }
///
///     public func data(from url: URL) async throws -> Data {
///         // Custom implementation to fetch data
///         let (data, _) = try await URLSession.shared.data(from: url)
///         return data
///     }
/// }
/// ```
public protocol ConfigurableNetworkProviding: NetworkProviding {
    /// Initializes the network provider with the specified configuration.
    /// - Parameter configuration: The `NetworkConfiguration` to use for the provider.
    init(configuration: NetworkConfiguration)

    /// Updates the network provider with a new configuration.
    /// - Parameter configuration: The new `NetworkConfiguration` to use for the provider.
    func configure(with configuration: NetworkConfiguration)
}

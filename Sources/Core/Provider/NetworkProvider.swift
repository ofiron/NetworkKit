//
//  NetworkProvider.swift
//  NetworkKit
//
//  Created by Ofir Ron on 21/12/2024.
//

import Foundation

/// A factory class for creating instances of `NetworkProviding`.
/// This class provides a static method to create a network provider based on a given configuration.
public class NetworkProvider {
    // No public initializer; this class is used as a factory.
}

extension NetworkProvider {
    /// Creates and returns a `NetworkProviding` instance based on the provided configuration.
    /// - Parameter configuration: The `NetworkConfiguration` to use for creating the network provider.
    /// - Returns: A `NetworkProviding` instance (e.g., `URLSessionNetworkProvider` or `AlamofireNetworkProvider`).
    public static func create(with configuration: NetworkConfiguration) -> NetworkProviding {
        // TODO: need to add selection of other type somehow
        URLSessionNetworkProvider(configuration: configuration)
        //        AlamofireNetworkProvider(configuration: configuration)
    }
    
    /// Creates and returns a `NetworkProviding` instance based on the provided provider type and configuration.
    /// - Parameters:
    ///   - providerType: The type of network provider to create (e.g., `URLSessionNetworkProvider.self`).
    ///   - configuration: The `NetworkConfiguration` to use for creating the network provider.
    /// - Returns: A `NetworkProviding` instance.
    ///
    /// # Example
    /// ```swift
    /// let configuration = NetworkConfiguration(
    ///     baseURL: googleSheetURL,  // URL instance
    ///     authorization: .bearerToken(token: accessToken)
    ///
    /// let urlSessionProvider = NetworkProvider.create(
    ///     providerType: URLSessionNetworkProvider.self,
    ///     with: configuration
    /// )
    /// ```
    public static func create<T: ConfigurableNetworkProviding>(
        providerType: T.Type,
        with configuration: NetworkConfiguration
    ) -> NetworkProviding {
        return providerType.init(configuration: configuration)
    }
}

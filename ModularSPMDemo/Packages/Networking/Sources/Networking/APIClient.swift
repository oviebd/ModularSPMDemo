//
//  APIClient.swift
//  ModularSPMDemo
//
//  Created by Habibur_Periscope on 17/6/26.
//


import FoundationKit

public final class APIClient: APIClientProtocol, Sendable {
    
    private let logger: AppLogger
    
    public init() {
        self.logger = AppLogger()
    }
    
    public func request(endpoint: String) async -> String {
        // No real API call — just simulating
        logger.log("Requesting endpoint: \(endpoint)", module: "Networking")
        if #available(iOS 13.0, *) {
            try? await Task.sleep(nanoseconds: 500_000_000)
        } else {
            // Fallback on earlier versions
        } // 0.5s fake delay
        logger.log("Response received from: \(endpoint)", module: "Networking")
        return "Mock response from \(endpoint)"
    }
}

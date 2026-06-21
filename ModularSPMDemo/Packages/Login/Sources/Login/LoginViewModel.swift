//
//  File.swift
//  Login
//
//  Created by Habibur_Periscope on 17/6/26.
//


import FoundationKit
import Networking
import Combine

@MainActor
public final class LoginViewModel: ObservableObject {
    
    @Published public var statusMessage: String = "Ready to login"
    
    private let apiClient: APIClientProtocol
    private let logger: AppLogger
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        self.logger = AppLogger()
    }
    
    public func login() async {
        logger.log("Login started", module: "Login")
        statusMessage = "Logging in..."
        let response = await apiClient.request(endpoint: "/auth/login")
        statusMessage = "Done: \(response)"
        logger.log("Login finished", module: "Login")
    }
}

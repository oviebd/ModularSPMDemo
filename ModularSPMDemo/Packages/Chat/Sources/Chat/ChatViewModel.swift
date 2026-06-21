//
//  File.swift
//  Chat
//
//  Created by Habibur_Periscope on 17/6/26.
//

import FoundationKit
import Networking
import Combine


@MainActor
public final class ChatViewModel: ObservableObject {
    
    @Published public var statusMessage: String = "Ready to chat"
    
    private let apiClient: APIClientProtocol
    private let logger: AppLogger
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        self.logger = AppLogger()
    }
    
    public func sendMessage() async {
        logger.log("Sending message", module: "Chat")
        statusMessage = "Sending..."
        let response = await apiClient.request(endpoint: "/chat/send")
        statusMessage = "Done: \(response)"
        logger.log("Message sent", module: "Chat")
    }
}

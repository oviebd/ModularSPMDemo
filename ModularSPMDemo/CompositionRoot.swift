//
//  CompositionRoot.swift
//  ModularSPMDemo
//
//  Created by Habibur_Periscope on 17/6/26.
//

import Networking
import Login
import Chat

// This is the ONLY place in the app that knows
// all modules exist and wires them together

@MainActor
struct CompositionRoot {
    
    let loginViewModel: LoginViewModel
    let chatViewModel: ChatViewModel
    
    init() {
        let apiClient = APIClient()
        self.loginViewModel = LoginViewModel(apiClient: apiClient)
        self.chatViewModel = ChatViewModel(apiClient: apiClient)
    }
}

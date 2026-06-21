//
//  ContentView.swift
//  ModularSPMDemo
//
//  Created by Habibur_Periscope on 17/6/26.
//
import SwiftUI
import Login
import Chat

struct ContentView: View {
    
    let root: CompositionRoot
    
    var body: some View {
        TabView {
            LoginView(viewModel: root.loginViewModel)
                .tabItem {
                    Label("Login", systemImage: "person")
                }
            ChatView(viewModel: root.chatViewModel)
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
        }
    }
}

#Preview {
    ContentView(root: CompositionRoot())
}

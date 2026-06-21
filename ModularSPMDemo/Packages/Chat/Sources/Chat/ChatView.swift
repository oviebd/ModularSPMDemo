//
//  File.swift
//  Chat
//
//  Created by Habibur_Periscope on 17/6/26.
//


import SwiftUI

public struct ChatView: View {
    
    @ObservedObject var viewModel: ChatViewModel
    
    public init(viewModel: ChatViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("Chat Module")
                .font(.headline)
            Text(viewModel.statusMessage)
                .foregroundColor(.secondary)
            Button("Tap to Send Message") {
                Task {
                    await viewModel.sendMessage()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

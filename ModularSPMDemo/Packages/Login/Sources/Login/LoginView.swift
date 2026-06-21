//
//  File.swift
//  Login
//
//  Created by Habibur_Periscope on 17/6/26.
//

import SwiftUI

public struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("Login Module")
                .font(.headline)
            Text(viewModel.statusMessage)
                .foregroundColor(.secondary)
            Button("Tap to Login") {
                Task {
                    await viewModel.login()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

//
//  ModularSPMDemoApp.swift
//  ModularSPMDemo
//
//  Created by Habibur_Periscope on 17/6/26.
//

import SwiftUI

@main
struct ModularSPMDemoApp: App {
    private let root = CompositionRoot()
    var body: some Scene {
        WindowGroup {
            ContentView(root: root)
        }
    }
}

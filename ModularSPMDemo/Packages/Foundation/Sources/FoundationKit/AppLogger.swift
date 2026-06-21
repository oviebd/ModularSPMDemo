//
//  AppLogger.swift
//  ModularSPMDemo
//
//  Created by Habibur_Periscope on 17/6/26.
//


public struct AppLogger: Sendable {
    
    public init() {}
    
    public func log(_ message: String, module: String) {
        print("[\(module)] \(message)")
    }
}

//
//  APIClientProtocol.swift
//  ModularSPMDemo
//
//  Created by Habibur_Periscope on 17/6/26.
//

import Foundation

public protocol APIClientProtocol: Sendable {
    func request(endpoint: String) async -> String
}

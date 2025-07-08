//
//  StarTrail.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 6/30/25.
//

//
//  StarTrailLog.swift
//  KinPod_v2
//
//  Created by Resonant Jones on 6/30/25.
//

import Foundation

/// StarTrailLog keeps an audit trail for important consent events, overrides, and trust edges.
public struct StarTrailLog: Codable, Identifiable {
    public let id: UUID
    public let timestamp: Date
    public let eventType: String
    public let details: String

    public init(eventType: String, details: String) {
        self.id = UUID()
        self.timestamp = Date()
        self.eventType = eventType
        self.details = details
    }
}

// Example usage:
// let logEntry = StarTrailLog(eventType: "ConsentOverride", details: "Parent forced unlock of meaning map")
// Save logEntry to secure storage, encrypted if possible.

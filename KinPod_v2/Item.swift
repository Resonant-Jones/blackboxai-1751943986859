//
//  Item.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 6/30/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

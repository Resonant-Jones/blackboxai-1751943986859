//
//  CozyMode.swift
//  KinPod_v2
//

import Foundation
import UserProfiles
import Tasks

/// A game mode focused on gentle, sensory-aware tasks.
public struct CozyMode: GameMode {
    // MARK: - Properties
    public let comfortLevel: Int  // 0-100 scale, how gentle Buddy should be
    public let sensoryFilters: [String]  // e.g., "Low Noise", "No Bright Colors"
    public let overstimThreshold: Int  // user-defined limit before tasks pause

    // MARK: - Initialization
    public init(comfortLevel: Int = 80,
                sensoryFilters: [String] = ["Low Noise", "Soft Lighting"],
                overstimThreshold: Int = 70) {
        self.comfortLevel = comfortLevel
        self.sensoryFilters = sensoryFilters
        self.overstimThreshold = overstimThreshold
    }

    // MARK: - GameMode Protocol
    /// Generates a gentle task for the given user profile.
    public func generateTask(for profile: UserProfile) -> Task {
        let baseTask = "Tidy your reading nook"
        let tip = "🫧 Cozy Tip: \(baseTask) — take breaks if needed."
        return Task(
            title: tip,
            description: "A cozy, mindful task for \(profile.name).",
            assignedTo: profile.id,
            dueDate: Date(),
            status: "Pending"
        )
    }
}

#if DEBUG
import SwiftUI

struct CozyMode_Previews: PreviewProvider {
    static var previews: some View {
        Text("CozyMode Preview")
            .padding()
    }
}
#endif

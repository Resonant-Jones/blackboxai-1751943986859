//
//  NormalMode.swift
//  KinPod_v2
//

import Foundation

/// Represents the default game mode with standard rules and no special modifiers.
public struct NormalMode: GameMode {
    // MARK: - Initialization
    public init() {}

    // MARK: - GameMode Protocol

    /// Generates a standard chore task for the given user profile.
    public func generateTask(for profile: UserProfile) -> Task {
        return Task(
            title: "Normal Chore",
            description: "A standard task for \(profile.name)",
            assignedTo: profile.id,
            dueDate: Date(),
            status: "Pending"
        )
    }
}

#if DEBUG
import SwiftUI

struct NormalMode_Previews: PreviewProvider {
    static var previews: some View {
        Text("NormalMode Preview")
            .padding()
    }
}
#endif


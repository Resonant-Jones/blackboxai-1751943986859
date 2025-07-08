//
//  GameMode.swift
//  KinPod_v2
//

import Foundation

/// A protocol representing a game mode capable of generating Tasks.
public protocol GameMode {
    /// A human-readable name for this mode.
    var name: String { get }

    /// Creates a Task for the given user profile.
    func generateTask(for profile: UserProfile) -> Task
}

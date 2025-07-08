import Foundation

/// Represents a household hero using KinPod.
public struct UserProfile: Identifiable, Codable, Equatable {
    public let id = UUID()
    public let name: String
    public let avatarSystemImage: String
    public var weighting: Int = 1
    public var journal: [JournalEntry] = [] // Each hero’s personal Codex
}

import Foundation

/// A single quest bestowed upon the player.
public struct Task: Identifiable, Codable {
    public let id = UUID()
    public let title: String
    public let prompt: String
    public let category: Category
    public let reward: String?
    public let swappable: Bool
    public let assignedTo: String?
    public let starTrailID: String?
    
    public let dueDate: Date?
    public var completedAt: Date?
    public let priority: Priority
    public let notes: String?

    public enum Category: String, Codable {
        case cleaning, selfCare = "self-care", chaos
    }
    
    public enum Priority: String, Codable {
        case low, medium, high
    }
}

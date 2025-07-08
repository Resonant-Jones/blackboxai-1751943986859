// GameModes/MischiefMode.swift

import Foundation
import UserProfiles
import Tasks

struct MischiefMode: GameMode {
    let mischiefLevel: Int // 0-100 scale, playful tasks
    let goblinHints: [String]
    let rewardSurprises: [String]

    init() {
        self.mischiefLevel = 30
        self.goblinHints = ["A sock is hiding under the bed!", "Look behind the couch!"]
        self.rewardSurprises = ["Extra screen time!", "Secret snack!"]
    }

    func revealHint() -> String {
        return goblinHints.randomElement() ?? "No goblin mischief today!"
    }

    func revealSurprise() -> String {
        return rewardSurprises.randomElement() ?? "No surprise reward this time!"
    }

    /// Generates a playful mischief task for the given user profile.
    public func generateTask(for profile: UserProfile) -> Task {
        let hint = revealHint()
        return Task(
            title: "Mischief Task: \(hint)",
            description: "A playful task inspired by goblin mischief for \(profile.name).",
            assignedTo: profile.id,
            dueDate: Date(),
            status: "Pending"
        )
    }
}

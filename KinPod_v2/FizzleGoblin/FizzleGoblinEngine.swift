import Foundation

/// Injects a spark of absurdity into everyday rituals.
public final class FizzleGoblinEngine {
    
    public init() {}
    
    /// Returns a single random chaos task.
    public func randomChaosTask() -> Task {
        let chaosTasks = [
            Task(title: "Goblin Stretch", prompt: "Wiggle every limb and grin at the nearest appliance.", category: .chaos, reward: "A ripple of laughter"),
            Task(title: "Whisper to Water", prompt: "Sing a two-line ballad to your water glass.", category: .chaos, reward: nil)
        ]
        return chaosTasks.randomElement()!
    }
    
    /// Example: Shuffle a list of tasks.
    public func shuffleTasks(_ tasks: [Task]) -> [Task] {
        return tasks.shuffled()
    }
    
    /// Example: Generate a surprise reward for a user.
    public func surpriseReward(for user: UserProfile) -> Int {
        return Int.random(in: 1...10)
    }
}

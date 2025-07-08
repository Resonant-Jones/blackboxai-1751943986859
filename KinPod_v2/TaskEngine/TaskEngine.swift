import Foundation

/// Conjures and manages tasks using Gemma 3n (placeholder) and CoreML mood.
public final class TaskEngine {
    /// Stores all current tasks.
    public private(set) var tasks: [Task] = []

    /// Generates a whimsical task for the chosen mode.
    public func generateTask(for mode: GameMode) -> Task {
        // TODO: Integrate Gemma 3n for mood-based personalization.

        let tasks = [
            Task(
                title: "Dust Dance",
                prompt: "Twirl with a feather duster and clear the cobwebs.",
                category: .cleaning,
                reward: "A shimmering high-five",
                swappable: true,
                assignedTo: nil,
                starTrailID: nil,
                dueDate: nil,
                completedAt: nil,
                priority: .medium,
                notes: nil
            ),
            Task(
                title: "Mirror Pep Talk",
                prompt: "Recite three compliments to yourself in the mirror.",
                category: .selfCare,
                reward: nil,
                swappable: true,
                assignedTo: nil,
                starTrailID: nil,
                dueDate: nil,
                completedAt: nil,
                priority: .low,
                notes: nil
            ),
            Task(
                title: "Sock Oracle",
                prompt: "Arrange three socks and whisper a secret to the cat.",
                category: .chaos,
                reward: "Goblin giggles",
                swappable: true,
                assignedTo: nil,
                starTrailID: nil,
                dueDate: nil,
                completedAt: nil,
                priority: .high,
                notes: nil
            )
        ]

        let task = tasks.randomElement()!
        self.tasks.append(task)
        print("🔮 Conjured task: \(task.title) for mode: \(mode)")
        return task
    }

    /// Adds a new task manually.
    public func addTask(_ task: Task) {
        tasks.append(task)
    }

    /// Marks a task complete by ID.
    public func markComplete(taskID: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == taskID }) {
            tasks[index].completedAt = Date()
        }
    }
}

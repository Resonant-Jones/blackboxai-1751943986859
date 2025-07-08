// GameModes/ChaosMode.swift

import Foundation

struct ChaosMode {
    let chaosLevel: Int // 0-100 scale, how mischievous Buddy gets
    let surpriseTasks: [String]
    let goblinMode: Bool

    init() {
        self.chaosLevel = 25
        self.surpriseTasks = []
        self.goblinMode = false
    }

    mutating func toggleGoblinMode() {
        goblinMode.toggle()
    }

    mutating func addSurpriseTask(_ task: String) {
        surpriseTasks.append(task)
    }

    func revealSurprise() -> String {
        return surpriseTasks.randomElement() ?? "No surprises today!"
    }
    
    func generateTask(for user: UserProfile) -> Task {
        let surprise = revealSurprise()
        return Task(
            title: "Chaos Task: \(surprise)",
            assignedTo: user
        )
    }
}// GameModes/ChaosMode.swift

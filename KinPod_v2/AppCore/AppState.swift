import SwiftUI

/// The mystical heartbeat of KinPod. Governs navigation and shared data.
final class AppState: ObservableObject {
    @Published var currentProfile: UserProfile?
    @Published var currentMode: GameMode = .quickShuffle
    @Published var revealedTask: Task?
    @Published var showProfileSelection: Bool = false
    @Published var showModeSelector: Bool = false
}

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var kinSocket: KinSocket

    @State private var isSyncing: Bool = false
    @State private var syncError: String? = nil
    @State private var showSyncComplete: Bool = false

    // Debug toggles
    @State private var isDebugEmptyState: Bool = false
    @State private var isDebugLoadingState: Bool = false
    @State private var isDebugErrorState: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Toggle("Debug: Empty State", isOn: $isDebugEmptyState)
                    .padding()
                Toggle("Debug: Loading State", isOn: $isDebugLoadingState)
                    .padding()
                Toggle("Debug: Error State", isOn: $isDebugErrorState)
                    .padding()

                if isDebugEmptyState {
                    Text("No game modes available.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    GameModeSelectorView(selectedMode: $appState.currentMode)
                }

                if isDebugLoadingState || isSyncing {
                    ProgressView("Syncing...")
                        .progressViewStyle(CircularProgressViewStyle())
                }

                if isDebugErrorState || syncError != nil {
                    VStack {
                        Text("Sync Error: \(syncError ?? "Simulated error")")
                            .foregroundColor(.red)
                        Button("Retry") {
                            triggerSync()
                        }
                    }
                }

                if showSyncComplete && !isDebugLoadingState && !isDebugErrorState {
                    Text("Sync Complete")
                        .foregroundColor(.green)
                        .transition(.opacity)
                }

                NavigationLink(destination: LorekeeperView()) {
                    Text("Open Lorekeeper")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("KinPod")
            .padding()
            .onChange(of: appState.currentMode) { newMode in
                triggerSync()
            }
            .onAppear {
                triggerSync()
            }
        }
    }

    private func triggerSync() {
        guard let profile = appState.currentProfile else { return }
        if isDebugErrorState {
            syncError = "Simulated error"
            isSyncing = false
            showSyncComplete = false
            return
        }
        if isDebugLoadingState {
            isSyncing = true
            syncError = nil
            showSyncComplete = false
            return
        }
        isSyncing = true
        syncError = nil
        showSyncComplete = false

        DispatchQueue.global().async {
            kinSocket.syncTasks(profiles: [profile])
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isSyncing = false
                showSyncComplete = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        showSyncComplete = false
                    }
                }
            }
        }
    }
}

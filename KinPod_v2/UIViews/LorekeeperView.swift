// UIViews/LorekeeperView.swift

import SwiftUI

struct LorekeeperView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var kinSocket: KinSocket
    @State private var reflectionText: String = ""
    @State private var isSharing: Bool = false
    @State private var shareError: String? = nil
    @State private var shareSuccess: Bool = false

    // Debug toggles
    @State private var isDebugEmptyState: Bool = false
    @State private var isDebugLoadingState: Bool = false
    @State private var isDebugErrorState: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Toggle("Debug: Empty State", isOn: $isDebugEmptyState)
                .padding()
            Toggle("Debug: Loading State", isOn: $isDebugLoadingState)
                .padding()
            Toggle("Debug: Error State", isOn: $isDebugErrorState)
                .padding()

            if isDebugEmptyState {
                Text("No reflections available.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                TextEditor(text: $reflectionText)
                    .frame(height: 200)
                    .border(Color.gray, width: 1)
                    .padding()
            }

            if isDebugLoadingState || isSharing {
                ProgressView("Sharing...")
                    .progressViewStyle(CircularProgressViewStyle())
            }

            if isDebugErrorState || shareError != nil {
                VStack {
                    Text("Error: \(shareError ?? "Simulated error")")
                        .foregroundColor(.red)
                    Button("Retry") {
                        shareReflection()
                    }
                }
            }

            if shareSuccess && !isDebugLoadingState && !isDebugErrorState {
                Text("Reflection shared successfully!")
                    .foregroundColor(.green)
                    .transition(.opacity)
            }

            Button(action: {
                shareReflection()
            }) {
                Text("Log Reflection")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    private func shareReflection() {
        guard let profile = appState.currentProfile else { return }
        if isDebugErrorState {
            shareError = "Simulated error"
            isSharing = false
            shareSuccess = false
            return
        }
        if isDebugLoadingState {
            isSharing = true
            shareError = nil
            shareSuccess = false
            return
        }
        isSharing = true
        shareError = nil
        shareSuccess = false

        DispatchQueue.global().async {
            kinSocket.shareContext(from: profile, to: profile, context: reflectionText)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isSharing = false
                shareSuccess = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        shareSuccess = false
                    }
                }
            }
        }
    }
}

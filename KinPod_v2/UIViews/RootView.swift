//
//  RootView.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 6/30/25.
//

import SwiftUI

/// RootView.swift
/// The main entry point for KinPod’s UI.
/// Presents the four core tabs: Hearth, DreamSketcher, Tasks, and Profiles.
/// Includes TODO hooks for trust edges, iCloud sync, and ThreadSpace orchestration.

struct RootView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HearthRoomView()
                .tabItem {
                    Label("Hearth", systemImage: "house.fill")
                }
                .tag(0)

            DreamSketcherView()
                .tabItem {
                    Label("DreamSketcher", systemImage: "pencil.and.outline")
                }
                .tag(1)

            TasksView()
                .tabItem {
                    Label("Tasks", systemImage: "checkmark.circle.fill")
                }
                .tag(2)

            ProfilesView()
                .tabItem {
                    Label("Profiles", systemImage: "person.2.fill")
                }
                .tag(3)
        }
        .onAppear {
            // TODO: Apply trust edges (e.g., show consent banner if needed)
            // TODO: Set up iCloud sync hooks
            // TODO: Initialize ThreadSpace orchestration bridge
        }
    }
}

#Preview {
    RootView()
}

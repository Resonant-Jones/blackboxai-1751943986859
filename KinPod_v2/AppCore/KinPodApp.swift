//
//  KinPodApp.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 6/30/25.
//

//
//  KinPodApp.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 6/30/25.
//

import SwiftUI

@main
struct KinPodApp: App {
    // Core shared state or stores can go here
    @StateObject private var profileStore = ProfileStore()
    private let kinSocket = KinSocket()
    @StateObject private var taskStore = TaskStore()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(profileStore)
                .environmentObject(kinSocket)
                .environmentObject(taskStore)
                // Connect taskStore to kinSocket
                .onAppear {
                    kinSocket.setTaskStore(taskStore)
                }
                // TODO: Add trust edges where relevant
        }
    }
}

// UIViews/ProfileSelectionView.swift

// UIViews/ProfileSelectionView.swift

import SwiftUI

import SwiftUI

import SwiftUI

struct ProfileSelectionView: View {
    @EnvironmentObject var profileStore: ProfileStore
    @EnvironmentObject var appState: AppState

    @State private var animateSelection = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Select Your Profile")
                .font(.largeTitle)

            if profileStore.profiles.isEmpty {
                Text("No profiles available. Please create a new profile.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ForEach(profileStore.profiles, id: \.id) { profile in
                    Button(action: {
                        withAnimation {
                            appState.currentProfile = profile
                            appState.showProfileSelection = false
                            animateSelection.toggle()
                        }
                    }) {
                        Text(profile.name)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(appState.currentProfile?.id == profile.id ? Color.blue : Color.blue.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .scaleEffect(appState.currentProfile?.id == profile.id && animateSelection ? 1.05 : 1.0)
                            .animation(.easeInOut(duration: 0.3), value: animateSelection)
                    }
                }
            }

            Button(action: {
                // TODO: Add logic to create a new profile
            }) {
                Text("Create New Profile")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct ProfileSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectionView()
    }
}

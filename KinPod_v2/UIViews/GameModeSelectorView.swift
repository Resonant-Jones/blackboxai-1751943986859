
// UIViews/GameModeSelectorView.swift

import SwiftUI

struct GameModeSelectorView: View {
    @Binding var selectedMode: GameMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Choose Your Game Mode")
                .font(.headline)

            Button("Normal Mode") {
                selectedMode = .normal
            }

            Button("Cozy Mode") {
                selectedMode = .cozy(CozyMode())
            }

            Button("Mischief Mode") {
                selectedMode = .chaos(ChaosMode())
            }
        }
        .padding()
    }
}

struct GameModeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        GameModeSelectorView(selectedMode: .constant(.normal))
    }
}

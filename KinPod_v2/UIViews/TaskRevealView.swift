// UIViews/TaskRevealView.swift

import SwiftUI

struct TaskRevealView: View {
    var taskName: String

    var body: some View {
        VStack(spacing: 20) {
            Text("🔍 Task Reveal")
                .font(.largeTitle)

            Text(taskName)
                .font(.title)
                .padding()
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(12)

            Text("Buddy says: Take a deep breath, one step at a time.")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct TaskRevealView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRevealView(taskName: "Fold Towels")
    }
}

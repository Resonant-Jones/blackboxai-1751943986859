// UIViews/RootView.swift

import SwiftUI

struct RootView: View {
    @State private var isProfileSelected = false
    @State private var selectedProfile: String? = nil

    var body: some View {
        if isProfileSelected {
            MainView()
        } else {
            ProfileSelectionView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

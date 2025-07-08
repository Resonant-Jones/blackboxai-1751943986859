//
//  HearthRoomView.swift
//  KinPod
//
//  Created by Christopher Castillo on 6/30/25.
//

import SwiftUI

public struct HearthRoomView: View {
    public var body: some View {
        NavigationView {
            List {
                Text("Family Chat: Example Post")
                    .contextMenu {
                        Button("Semantic Translate") {
                            // TODO: Hook into semantic translation
                        }
                    }
            }
            .navigationTitle("Hearth Room")
        }
    }
}


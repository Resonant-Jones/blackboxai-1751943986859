//
//  ConsentBannerView.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 6/30/25.
//

import SwiftUI

struct ConsentBannerView: View {
    var body: some View {
        VStack {
            Text(Lorekeeper.trustManifesto)
                .font(.headline)
            Text(Lorekeeper.tripleConsentPolicy)
                .font(.subheadline)
            Button("I Agree") {
                // TODO: Handle consent action
            }
        }
        .padding()
    }
}

#Preview {
    ConsentBannerView()
}

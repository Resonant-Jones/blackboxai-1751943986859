//
//  Untitled.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 7/1/25.
//


//
//  DrawingView.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 7/1/25.
//

import SwiftUI
import PencilKit

/// A SwiftUI wrapper around PKCanvasView for freehand drawing.
struct DrawingView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // No additional updates needed for now
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView(canvasView: .constant(PKCanvasView()))
    }
}

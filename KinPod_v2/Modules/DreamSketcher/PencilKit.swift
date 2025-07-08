//
//  DrawingView.swift
//  KinPod
//
//  Created by Christopher Castillo on 6/29/25.
//

import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 5)
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) { }
}

extension DrawingView {
    func saveDrawing() {
        // TODO: Serialize PKDrawing to local file
    }

    func loadDrawing() {
        // TODO: Load PKDrawing from local file
    }
}


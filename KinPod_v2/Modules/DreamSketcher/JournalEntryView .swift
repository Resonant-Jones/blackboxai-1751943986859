//
//  JournalEntryView 2.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 7/1/25.
//


//
//  JournalEntryView.swift
//  KinPod
//
//  Created by Christopher Castillo on 6/29/25.
//

import SwiftUI
import PencilKit

struct JournalEntryView: View {
    @ObservedObject var journalStore: JournalStore
    @State private var entryText: String = ""
    @State private var canvasView = PKCanvasView()

    var body: some View {
        VStack(spacing: 20) {
            Text("📔 DreamSketcher Journal")
                .font(.largeTitle)

            TextEditor(text: $entryText)
                .frame(height: 200)
                .border(Color.gray, width: 1)
                .padding()

            DrawingView(canvasView: $canvasView)
                .frame(height: 300)
                .border(Color.purple, width: 1)
                .padding()

            Button(action: saveEntry) {
                Text("Save Journal Entry")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    private func saveEntry() {
        // Rasterize the drawing
        let image = canvasView.drawing.image(from: canvasView.bounds, scale: 1.0)
        let filename = "drawing-\(UUID().uuidString).png"

        // Save image to local docs dir
        if let data = image.pngData() {
            let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let url = docs.appendingPathComponent(filename)
            try? data.write(to: url)

            let sketcher = DreamSketcher()
            let tempEntry = JournalEntry(
                date: Date(),
                text: entryText,
                images: [filename],
                stylizedCaption: nil
            )
            let stylized = sketcher.stylize(entry: tempEntry)

            let newEntry = JournalEntry(
                date: Date(),
                text: entryText,
                images: [filename],
                stylizedCaption: stylized
            )

            journalStore.entries.append(newEntry)
            entryText = ""
            canvasView.drawing = PKDrawing()
        }
    }
}

struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryView(journalStore: JournalStore())
    }
}

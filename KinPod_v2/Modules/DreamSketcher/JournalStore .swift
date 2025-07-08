//
//  JournalStore.swift
//  KinPod
//
//  Created by Christopher Castillo on 6/29/25.
//

final class JournalStore: ObservableObject {
    @Published var entries: [JournalEntry] = []
    // TODO: Local encryption + iCloud fallback

    func saveLocally() {
        do {
            let data = try JSONEncoder().encode(entries)
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("JournalEntries.json")
            try data.write(to: url)
        } catch {
            print("Failed to save journal entries: \(error)")
        }
    }

    func loadLocally() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("JournalEntries.json")
        do {
            let data = try Data(contentsOf: url)
            entries = try JSONDecoder().decode([JournalEntry].self, from: data)
        } catch {
            print("Failed to load journal entries: \(error)")
        }
    }

    func encryptEntries() {
        // TODO: Add local encryption logic
    }

    func syncToICloud() {
        // TODO: Optional iCloud sync fallback
    }
}

// Ensure JournalEntry conforms to Codable for local save/load
extension JournalEntry: Codable {}

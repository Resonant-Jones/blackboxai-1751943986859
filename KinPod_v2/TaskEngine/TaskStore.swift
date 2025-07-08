import Foundation
import Combine

/// Manages the collection of tasks with persistence.
public final class TaskStore: ObservableObject {
    @Published public var tasks: [Task] = []
    
    public init() {}
    
    /// Save tasks to local JSON file for testing.
    public func save() {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        if let data = try? encoder.encode(tasks) {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("tasks.json")
            try? data.write(to: url)
            print("Tasks saved to \\(url)")
        }
    }
    
    /// Load tasks from local JSON file for testing.
    public func load() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("tasks.json")
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let loadedTasks = try? decoder.decode([Task].self, from: data) {
                tasks = loadedTasks
                print("Tasks loaded from \\(url)")
            }
        }
    }
}

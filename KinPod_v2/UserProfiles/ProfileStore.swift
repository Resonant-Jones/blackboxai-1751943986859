import Foundation
// If UserProfile is defined locally in the same module, remove this import.
import UserProfiles
// No need to import if it's local — instead:
/// Temporary in-memory store for profiles until secure storage arrives.
/// TODO: Swap to secure iCloud Keychain or encrypted local CoreData vault.
public final class ProfileStore: ObservableObject {
    @Published public var profiles: [UserProfile] = [
        UserProfile(name: "Alex", avatarSystemImage: "person.circle"),
        UserProfile(name: "Sam", avatarSystemImage: "bolt.heart"),
        UserProfile(name: "Riley", avatarSystemImage: "leaf")
    ]
    
    public init() {}
    
    public func addProfile(_ profile: UserProfile) {
        profiles.append(profile)
    }
    
    public func removeProfile(at index: Int) {
        profiles.remove(at: index)
    }
    
    /// Placeholder for secure save
    public func save() {
        // Simple JSON file save for testing
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(profiles) {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("profiles.json")
            try? data.write(to: url)
            print("Profiles saved to \\(url)")
        }
    }
    
    /// Placeholder for secure load
    public func load() {
        // Simple JSON file load for testing
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("profiles.json")
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let loadedProfiles = try? decoder.decode([UserProfile].self, from: data) {
                profiles = loadedProfiles
                print("Profiles loaded from \\(url)")
            }
        }
    }
}

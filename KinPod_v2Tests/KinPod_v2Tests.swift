import XCTest
@testable import KinPod_v2

final class KinPod_v2Tests: XCTestCase {
    func testProfileStorePersistence() {
        let profileStore = ProfileStore()
        let testProfile = UserProfile(name: "TestUser", avatarSystemImage: "person.fill")
        profileStore.addProfile(testProfile)
        profileStore.save()
        
        let loadedProfileStore = ProfileStore()
        loadedProfileStore.load()
        
        XCTAssertTrue(loadedProfileStore.profiles.contains(where: { $0.name == "TestUser" }))
    }
    
    func testTaskStorePersistence() {
        let taskStore = TaskStore()
        let testTask = Task(title: "Test Task", prompt: "Test Prompt", category: .cleaning, reward: "Reward", swappable: false, assignedTo: nil, starTrailID: nil, dueDate: nil, completedAt: nil, priority: .medium, notes: nil)
        taskStore.tasks.append(testTask)
        taskStore.save()
        
        let loadedTaskStore = TaskStore()
        loadedTaskStore.load()
        
        XCTAssertTrue(loadedTaskStore.tasks.contains(where: { $0.title == "Test Task" }))
    }
    
    func testKinSocketSyncTasks() {
        let kinSocket = KinSocket()
        let taskStore = TaskStore()
        kinSocket.setTaskStore(taskStore)
        
        let task1 = Task(title: "Task 1", prompt: "Prompt 1", category: .cleaning, reward: nil, swappable: false, assignedTo: nil, starTrailID: nil, dueDate: nil, completedAt: nil, priority: .low, notes: nil)
        taskStore.tasks = [task1]
        
        let profile1 = UserProfile(name: "User1", avatarSystemImage: "person")
        kinSocket.syncTasks(profiles: [profile1])
        
        XCTAssertEqual(taskStore.tasks.count, 1)
    }
    
    func testKinSocketShareContext() {
        let kinSocket = KinSocket()
        let profile1 = UserProfile(name: "User1", avatarSystemImage: "person")
        let profile2 = UserProfile(name: "User2", avatarSystemImage: "person.fill")
        
        let expectation = XCTestExpectation(description: "Context shared")
        
        kinSocket.shareContext(from: profile1, to: profile2, context: "Test context")
        
        // Since shareContext uses asyncAfter, wait briefly
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
}

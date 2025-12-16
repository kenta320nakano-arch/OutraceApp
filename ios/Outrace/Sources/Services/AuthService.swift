import Foundation

protocol AuthServiceProtocol {
    func login(username: String, password: String) async throws -> User
    func logout() async throws
    func register(name: String, email: String, password: String) async throws -> User
    func getCurrentUser() -> User?
}

class MockAuthService: AuthServiceProtocol {
    private var currentUser: User?
    
    func login(username: String, password: String) async throws -> User {
        // Mock implementation - always succeeds
        try await Task.sleep(nanoseconds: 500_000_000) // Simulate network delay
        let user = User.mockUser
        currentUser = user
        return user
    }
    
    func logout() async throws {
        currentUser = nil
    }
    
    func register(name: String, email: String, password: String) async throws -> User {
        // Mock implementation
        try await Task.sleep(nanoseconds: 500_000_000)
        let user = User(name: name, email: email)
        currentUser = user
        return user
    }
    
    func getCurrentUser() -> User? {
        return currentUser ?? User.mockUser
    }
}

// Singleton for easy access during development
class AuthService {
    static let shared: AuthServiceProtocol = MockAuthService()
}

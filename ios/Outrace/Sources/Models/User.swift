import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var email: String
    var profileImageURL: String?
    var bio: String?
    var joinedDate: Date
    
    init(id: UUID = UUID(),
         name: String,
         email: String,
         profileImageURL: String? = nil,
         bio: String? = nil,
         joinedDate: Date = Date()) {
        self.id = id
        self.name = name
        self.email = email
        self.profileImageURL = profileImageURL
        self.bio = bio
        self.joinedDate = joinedDate
    }
}

// Mock data for development
extension User {
    static let mockUser = User(
        name: "Outdoor Explorer",
        email: "explorer@outrace.app",
        bio: "Adventure enthusiast and nature lover 🌲"
    )
}

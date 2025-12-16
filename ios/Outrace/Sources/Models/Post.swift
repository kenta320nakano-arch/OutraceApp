import Foundation

struct Post: Identifiable, Codable {
    let id: UUID
    var content: String
    var authorId: UUID
    var createdAt: Date
    var imageURL: String?
    var location: String?
    var tags: [String]
    
    init(id: UUID = UUID(), 
         content: String, 
         authorId: UUID, 
         createdAt: Date = Date(),
         imageURL: String? = nil,
         location: String? = nil,
         tags: [String] = []) {
        self.id = id
        self.content = content
        self.authorId = authorId
        self.createdAt = createdAt
        self.imageURL = imageURL
        self.location = location
        self.tags = tags
    }
}

// Mock data for development
extension Post {
    static let mockPosts: [Post] = [
        Post(content: "Amazing hike today in the mountains! 🏔️", 
             authorId: User.mockUser.id,
             location: "Rocky Mountains",
             tags: ["hiking", "nature"]),
        Post(content: "Beautiful sunset at the beach 🌅",
             authorId: User.mockUser.id,
             location: "California Coast",
             tags: ["beach", "sunset"])
    ]
}

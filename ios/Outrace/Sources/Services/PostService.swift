import Foundation

protocol PostServiceProtocol {
    func createPost(content: String, imageURL: String?, location: String?, tags: [String]) async throws -> Post
    func getPosts() async throws -> [Post]
    func getPostById(id: UUID) async throws -> Post?
    func deletePost(id: UUID) async throws
}

class MockPostService: PostServiceProtocol {
    private var posts: [Post] = Post.mockPosts
    
    func createPost(content: String, imageURL: String?, location: String?, tags: [String]) async throws -> Post {
        try await Task.sleep(nanoseconds: 500_000_000) // Simulate network delay
        
        let newPost = Post(
            content: content,
            authorId: User.mockUser.id,
            imageURL: imageURL,
            location: location,
            tags: tags
        )
        posts.insert(newPost, at: 0)
        return newPost
    }
    
    func getPosts() async throws -> [Post] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return posts
    }
    
    func getPostById(id: UUID) async throws -> Post? {
        return posts.first { $0.id == id }
    }
    
    func deletePost(id: UUID) async throws {
        posts.removeAll { $0.id == id }
    }
}

// Singleton for easy access during development
class PostService {
    static let shared: PostServiceProtocol = MockPostService()
}

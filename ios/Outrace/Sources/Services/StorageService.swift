import Foundation
import UIKit

protocol StorageServiceProtocol {
    func uploadImage(image: UIImage) async throws -> String
    func downloadImage(url: String) async throws -> UIImage?
    func deleteImage(url: String) async throws
}

class MockStorageService: StorageServiceProtocol {
    private var imageStore: [String: UIImage] = [:]
    
    func uploadImage(image: UIImage) async throws -> String {
        try await Task.sleep(nanoseconds: 500_000_000) // Simulate upload delay
        
        let url = "mock://image/\(UUID().uuidString).jpg"
        imageStore[url] = image
        return url
    }
    
    func downloadImage(url: String) async throws -> UIImage? {
        try await Task.sleep(nanoseconds: 300_000_000) // Simulate download delay
        return imageStore[url]
    }
    
    func deleteImage(url: String) async throws {
        imageStore.removeValue(forKey: url)
    }
}

// Singleton for easy access during development
class StorageService {
    static let shared: StorageServiceProtocol = MockStorageService()
}

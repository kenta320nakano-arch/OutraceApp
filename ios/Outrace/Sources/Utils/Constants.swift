import Foundation

struct Constants {
    // API Configuration
    static let apiURL = "https://api.outraceapp.com"
    static let apiVersion = "v1"
    
    // App Configuration
    static let appName = "Outrace"
    static let appVersion = "1.0.0"
    
    // UI Constants
    static let maxPostLength = 500
    static let profileImageSize: CGFloat = 100
    static let thumbnailSize: CGFloat = 60
    
    // Network
    static let requestTimeout: TimeInterval = 30
    
    // Storage Keys (UserDefaults)
    struct StorageKeys {
        static let userToken = "user_token"
        static let userId = "user_id"
        static let hasSeenOnboarding = "has_seen_onboarding"
    }
    
    // Feature Flags
    struct Features {
        static let enableImageUpload = false
        static let enableComments = false
        static let enableNotifications = false
    }
}

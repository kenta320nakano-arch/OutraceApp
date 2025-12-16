# Outrace iOS App

Native SwiftUI implementation of the Outrace outdoor social platform.

## Quick Start

### Prerequisites
- Xcode 15.0 or later
- iOS 16.0+ deployment target
- macOS for development

### Opening the Project

```bash
open Outrace.xcodeproj
```

### First Run Setup

1. **Configure Signing**:
   - Select the **Outrace** project in Xcode's navigator
   - Choose the **Outrace** target
   - Navigate to **Signing & Capabilities**
   - Select your development team
   - Update the Bundle Identifier from `com.example.outrace` to your unique identifier

2. **Select Target**:
   - Choose a simulator or connected device from the scheme menu
   - iPhone 14 Pro simulator is recommended for development

3. **Build & Run**:
   - Press ⌘R or click the Run button
   - First build may take a minute to compile

## Project Structure

```
Outrace/
├── Sources/
│   ├── App/               # Application entry and theme
│   │   ├── OutraceApp.swift
│   │   └── AppTheme.swift
│   ├── Screens/           # Main application screens
│   │   ├── HomeView.swift
│   │   ├── PostView.swift
│   │   ├── ArchiveView.swift
│   │   └── ProfileView.swift
│   ├── Models/            # Data models
│   │   ├── Post.swift
│   │   └── User.swift
│   ├── Services/          # Business logic layer
│   │   ├── AuthService.swift
│   │   ├── PostService.swift
│   │   └── StorageService.swift
│   ├── Components/        # Reusable UI components
│   │   ├── PostCard.swift
│   │   ├── SimpleButton.swift
│   │   └── LightPostInput.swift
│   └── Utils/             # Helper utilities
│       ├── Constants.swift
│       └── DateUtils.swift
└── Resources/
    └── Assets.xcassets/   # Colors, images, app icon
```

## Features

### Current Implementation

- ✅ TabView-based navigation (4 tabs)
- ✅ Home feed with post list
- ✅ Post creation interface
- ✅ Archive browsing
- ✅ User profile view
- ✅ Mock service implementations
- ✅ Outdoor-themed color palette
- ✅ SwiftUI previews for all components

### In Development

- ⏳ Real API integration
- ⏳ Image upload/display
- ⏳ User authentication
- ⏳ Data persistence
- ⏳ Network layer

## Architecture

### Service Layer

All services follow a protocol-based design:

```swift
protocol AuthServiceProtocol {
    func login(username: String, password: String) async throws -> User
    func logout() async throws
    // ...
}
```

Currently, mock implementations are used:
- `MockAuthService`: Simulates authentication with delays
- `MockPostService`: In-memory post storage
- `MockStorageService`: Mock image storage

Access via singletons:
```swift
AuthService.shared  // Returns AuthServiceProtocol
PostService.shared  // Returns PostServiceProtocol
StorageService.shared  // Returns StorageServiceProtocol
```

### UI Components

All views and components support SwiftUI previews. To view:
1. Open any view file (e.g., `HomeView.swift`)
2. Press ⌥⌘↩ or enable the Canvas
3. Click "Resume" if preview is paused

### Theme & Styling

Centralized in `AppTheme.swift`:
- Colors: Outdoor-inspired palette (greens, blues, browns)
- Spacing: Consistent padding and corner radius
- Typography: System fonts with semantic sizing

## Development Guidelines

### Code Style

- Use SwiftUI for all UI components
- Follow protocol-oriented design for services
- Keep views focused and composable
- Add preview providers to all views

### Mock Data

Mock data is available in model extensions:
```swift
Post.mockPosts  // Sample posts
User.mockUser   // Sample user
```

### Testing Previews

Each component has a preview provider:
```swift
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
```

## Troubleshooting

### Build Errors

**"No signing identity found"**
- Configure signing in project settings (see First Run Setup)

**"Command PhaseScriptExecution failed"**
- Clean build folder: ⇧⌘K
- Rebuild: ⌘B

### Runtime Issues

**App crashes on launch**
- Check Xcode console for error messages
- Verify Info.plist is correctly configured

**Colors not appearing**
- Ensure Assets.xcassets is included in target
- Rebuild project

## Resources

- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [Swift Language Guide](https://docs.swift.org/swift-book/)
- [Xcode Help](https://developer.apple.com/documentation/xcode)

## Support

For issues or questions about the iOS implementation, please check:
1. Xcode build logs
2. Console output during runtime
3. SwiftUI preview diagnostics

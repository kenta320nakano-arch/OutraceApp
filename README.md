# OutraceApp

A social engagement platform for outdoor enthusiasts to share their adventures and connect with the community.

## Project Status: Flutter → Swift Migration

This project is currently being migrated from Flutter to native Swift/SwiftUI for iOS.

### Current Structure

```
OutraceApp/
├── lib/                    # Original Flutter application (preserved during migration)
│   ├── models/
│   ├── screens/
│   ├── services/
│   ├── widgets/
│   └── ...
│
└── ios/Outrace/           # New SwiftUI iOS application
    ├── Outrace.xcodeproj/ # Xcode project
    ├── Sources/
    │   ├── App/           # App entry point and theme
    │   ├── Screens/       # Main screen views (Home, Post, Archive, Profile)
    │   ├── Models/        # Data models (Post, User)
    │   ├── Services/      # Service layer (Auth, Post, Storage)
    │   ├── Components/    # Reusable UI components
    │   └── Utils/         # Utility functions and constants
    ├── Resources/
    │   └── Assets.xcassets/  # App assets and color themes
    └── Info.plist         # iOS app configuration
```

## Swift iOS App

### Features

The iOS app includes:
- **TabView Navigation**: Four main tabs (Home, Post, Archive, Profile)
- **Outdoor Theme**: Color scheme featuring greens, blues, and browns inspired by nature
- **Mock Services**: In-memory implementations for development (Auth, Post, Storage)
- **SwiftUI Previews**: All components support Xcode previews

### Requirements

- **Xcode 15.0+** (supports iOS 16.0+)
- **macOS** (required for iOS development)
- **iOS Simulator** or physical iOS device

### Getting Started

#### 1. Open in Xcode

```bash
cd ios/Outrace
open Outrace.xcodeproj
```

#### 2. Configure Signing & Capabilities

⚠️ **Important**: Before building, you must configure code signing:

1. In Xcode, select the **Outrace** project in the navigator
2. Select the **Outrace** target
3. Go to **Signing & Capabilities** tab
4. Select your **Team** from the dropdown
5. Change the **Bundle Identifier** from `com.example.outrace` to your own unique identifier (e.g., `com.yourname.outrace`)

#### 3. Build and Run

1. Select a simulator or connected device from the scheme menu
2. Press **⌘R** or click the **Run** button
3. The app will build and launch in the simulator/device

### App Structure

#### Screens

- **HomeView**: Displays feed of posts from the community
- **PostView**: Create and share new outdoor adventure posts
- **ArchiveView**: Browse saved/archived posts
- **ProfileView**: User profile with stats and settings

#### Models

- **Post**: Represents a post with content, location, tags, and metadata
- **User**: User profile information

#### Services

All services use protocol-based architecture with mock implementations:

- **AuthService**: Authentication (login, register, logout)
- **PostService**: Post management (create, read, delete)
- **StorageService**: Image storage operations

#### Components

Reusable UI components:
- **PostCard**: Display individual post with author, content, and actions
- **SimpleButton**: Styled button matching app theme
- **LightPostInput**: Multi-line text input for creating posts

### Theme

The app uses an outdoor-inspired color palette:
- **Primary Green** (RGB: 51, 153, 77) - Nature and growth
- **Sky Blue** (RGB: 102, 179, 230) - Open skies
- **Earth Brown** (RGB: 128, 102, 77) - Natural terrain
- **Background Neutral** (RGB: 242, 242, 242) - Clean backdrop

### Development Notes

- All services currently use **mock implementations** for offline development
- No external dependencies required at this stage
- SwiftUI previews available for all views and components
- Code signing must be configured before first build
- Minimum deployment target: iOS 16.0

### Next Steps

1. ✅ Initial SwiftUI project structure
2. ⏳ Integrate real backend API
3. ⏳ Add image upload functionality
4. ⏳ Implement proper authentication flow
5. ⏳ Add networking layer
6. ⏳ Implement data persistence
7. ⏳ Add comprehensive testing

## Flutter App (Original)

The original Flutter application remains in the `lib/` directory and can still be run using standard Flutter commands. This is preserved during the migration process.

### Running Flutter App

```bash
flutter run
```

## Contributing

This project is actively under development. Please ensure you test both the Flutter and Swift versions if making changes that affect shared functionality.

## License

See [LICENSE](LICENSE) file for details.
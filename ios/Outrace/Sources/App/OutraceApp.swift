import SwiftUI

@main
struct OutraceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            PostView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Post")
                }
                .tag(1)
            
            ArchiveView()
                .tabItem {
                    Image(systemName: "archivebox.fill")
                    Text("Archive")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(AppTheme.primaryColor)
    }
}

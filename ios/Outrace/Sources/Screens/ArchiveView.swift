import SwiftUI

struct ArchiveView: View {
    @State private var archivedPosts: [Post] = []
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.backgroundColor
                    .ignoresSafeArea()
                
                if isLoading {
                    ProgressView("Loading archive...")
                } else if archivedPosts.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "archivebox")
                            .font(.system(size: 60))
                            .foregroundColor(AppTheme.secondaryText)
                        Text("No archived posts")
                            .font(.title2)
                            .foregroundColor(AppTheme.secondaryText)
                        Text("Your saved adventures will appear here")
                            .foregroundColor(AppTheme.secondaryText)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(archivedPosts) { post in
                                PostCard(post: post)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Archive")
            .task {
                await loadArchive()
            }
        }
    }
    
    private func loadArchive() async {
        isLoading = true
        // Mock: In real app, would load archived posts
        try? await Task.sleep(nanoseconds: 500_000_000)
        archivedPosts = []
        isLoading = false
    }
}

struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView()
    }
}

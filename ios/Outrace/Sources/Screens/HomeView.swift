import SwiftUI

struct HomeView: View {
    @State private var posts: [Post] = []
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.backgroundColor
                    .ignoresSafeArea()
                
                if isLoading {
                    ProgressView("Loading posts...")
                } else if posts.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 60))
                            .foregroundColor(AppTheme.secondaryText)
                        Text("No posts yet")
                            .font(.title2)
                            .foregroundColor(AppTheme.secondaryText)
                        Text("Share your outdoor adventures!")
                            .foregroundColor(AppTheme.secondaryText)
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(posts) { post in
                                PostCard(post: post)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Home")
            .task {
                await loadPosts()
            }
        }
    }
    
    private func loadPosts() async {
        isLoading = true
        do {
            posts = try await PostService.shared.getPosts()
        } catch {
            print("Error loading posts: \(error)")
        }
        isLoading = false
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

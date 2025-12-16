import SwiftUI

struct PostView: View {
    @State private var content: String = ""
    @State private var location: String = ""
    @State private var isPosting = false
    @State private var showSuccess = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.backgroundColor
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Post Input
                        LightPostInput(
                            content: $content,
                            location: $location,
                            placeholder: "Share your outdoor adventure..."
                        )
                        
                        // Post Button
                        SimpleButton(
                            title: isPosting ? "Posting..." : "Share Post",
                            action: {
                                Task {
                                    await createPost()
                                }
                            },
                            isDisabled: content.isEmpty || isPosting
                        )
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationTitle("Create Post")
            .alert("Post Shared!", isPresented: $showSuccess) {
                Button("OK") {
                    content = ""
                    location = ""
                }
            } message: {
                Text("Your adventure has been shared with the community!")
            }
        }
    }
    
    private func createPost() async {
        isPosting = true
        do {
            _ = try await PostService.shared.createPost(
                content: content,
                imageURL: nil,
                location: location.isEmpty ? nil : location,
                tags: []
            )
            showSuccess = true
        } catch {
            print("Error creating post: \(error)")
        }
        isPosting = false
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

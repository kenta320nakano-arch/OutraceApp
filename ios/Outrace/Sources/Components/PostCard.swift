import SwiftUI

struct PostCard: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Author info
            HStack {
                Circle()
                    .fill(AppTheme.primaryGreen)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                    )
                
                VStack(alignment: .leading) {
                    Text("Outdoor Explorer")
                        .font(.headline)
                    Text(post.createdAt, style: .relative)
                        .font(.caption)
                        .foregroundColor(AppTheme.secondaryText)
                }
                
                Spacer()
            }
            
            // Post content
            Text(post.content)
                .font(.body)
            
            // Location if available
            if let location = post.location {
                HStack {
                    Image(systemName: "location.fill")
                        .font(.caption)
                    Text(location)
                        .font(.caption)
                }
                .foregroundColor(AppTheme.secondaryText)
            }
            
            // Tags
            if !post.tags.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(post.tags, id: \.self) { tag in
                            Text("#\(tag)")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(AppTheme.primaryGreen.opacity(0.2))
                                .foregroundColor(AppTheme.primaryGreen)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            
            // Action buttons
            HStack(spacing: 20) {
                Button(action: {}) {
                    Label("Like", systemImage: "heart")
                }
                
                Button(action: {}) {
                    Label("Comment", systemImage: "bubble.right")
                }
                
                Button(action: {}) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                
                Spacer()
            }
            .font(.subheadline)
            .foregroundColor(AppTheme.secondaryText)
        }
        .padding(AppTheme.cardPadding)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadius)
        .shadow(radius: 2)
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard(post: Post.mockPosts[0])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

import SwiftUI

struct LightPostInput: View {
    @Binding var content: String
    @Binding var location: String
    var placeholder: String
    
    var body: some View {
        VStack(spacing: 16) {
            // Content Input
            VStack(alignment: .leading, spacing: 8) {
                Text("What's your adventure?")
                    .font(.headline)
                
                TextEditor(text: $content)
                    .frame(minHeight: 120)
                    .padding(8)
                    .background(AppTheme.cardBackground)
                    .cornerRadius(AppTheme.cornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: AppTheme.cornerRadius)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .overlay(
                        Group {
                            if content.isEmpty {
                                Text(placeholder)
                                    .foregroundColor(AppTheme.secondaryText)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 16)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                    .allowsHitTesting(false)
                            }
                        }
                    )
            }
            
            // Location Input
            VStack(alignment: .leading, spacing: 8) {
                Text("Location (optional)")
                    .font(.headline)
                
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(AppTheme.secondaryText)
                    
                    TextField("Where are you?", text: $location)
                }
                .padding()
                .background(AppTheme.cardBackground)
                .cornerRadius(AppTheme.cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: AppTheme.cornerRadius)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
        }
        .padding(AppTheme.cardPadding)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadius)
        .shadow(radius: 2)
    }
}

struct LightPostInput_Previews: PreviewProvider {
    static var previews: some View {
        LightPostInput(
            content: .constant(""),
            location: .constant(""),
            placeholder: "Share your adventure..."
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

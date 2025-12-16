import SwiftUI

struct SimpleButton: View {
    let title: String
    var action: () -> Void
    var isDisabled: Bool = false
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: AppTheme.buttonHeight)
                .background(
                    isDisabled ? AppTheme.secondaryText : AppTheme.primaryGreen
                )
                .cornerRadius(AppTheme.cornerRadius)
        }
        .disabled(isDisabled)
    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            SimpleButton(title: "Share Post", action: {})
            SimpleButton(title: "Disabled", action: {}, isDisabled: true)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

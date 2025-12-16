import SwiftUI

struct AppTheme {
    // Primary colors inspired by outdoor activities
    static let primaryColor = Color("PrimaryGreen")
    static let secondaryColor = Color("SkyBlue")
    static let accentColor = Color("EarthBrown")
    
    // Background colors
    static let backgroundColor = Color("BackgroundNeutral")
    static let cardBackground = Color.white
    
    // Text colors
    static let primaryText = Color.black
    static let secondaryText = Color.gray
    
    // Fallback colors if custom colors aren't loaded
    static let primaryGreen = Color(red: 0.2, green: 0.6, blue: 0.3)
    static let skyBlue = Color(red: 0.4, green: 0.7, blue: 0.9)
    static let earthBrown = Color(red: 0.5, green: 0.4, blue: 0.3)
    static let backgroundNeutral = Color(red: 0.95, green: 0.95, blue: 0.95)
    
    // Spacing and sizing
    static let cornerRadius: CGFloat = 12
    static let cardPadding: CGFloat = 16
    static let buttonHeight: CGFloat = 50
}
